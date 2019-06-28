#include <helipad_det/preprocess.h>
#include <helipad_det/signature_processing.h>
#include <helipad_det/signature_matching.h>
#include <helipad_det/pose_estimation.h>

class HelipadDetector{
	private:
		ros::NodeHandle nh_private;
		ros::NodeHandle nh_public;

		ros::Subscriber image_sub;
		ros::Subscriber odom_sub;
		
		ros::Publisher pose_pub;
		ros::Publisher image_pub;
		ros::Publisher image_pub_preprocess;

		int threshold;
		double a, b, c, d, signature_tolerance, area_tolerance;
		std::string mav_name;

		bool publish_preprocess, publish_detected_helipad;

		nav_msgs::Odometry odom;

		std::vector<double> cam_mat;
		std::vector<double> dist_coeff;

		cv::Mat frame, processed_frame, result;
	
	public:
	  	HelipadDetector():nh_private("~"), nh_public(){  
			// Subscribe to input video feed and publish output video feed
			nh_private.getParam("threshold", threshold);
			nh_private.getParam("a", a);
			nh_private.getParam("b", b);
			nh_private.getParam("c", c);
			nh_private.getParam("d", d);
			nh_private.getParam("signature_tolerance", signature_tolerance);
			nh_private.getParam("area_tolerance", area_tolerance);
			nh_private.getParam("camera_matrix/data", cam_mat);
			nh_private.getParam("distortion_coefficients/data", dist_coeff);
			nh_private.getParam("publish_preprocess", publish_preprocess);
			nh_private.getParam("publish_detected_helipad", publish_detected_helipad);
			nh_private.getParam("mav_name", mav_name);

			odom_sub = nh_public.subscribe("odom", 1, &HelipadDetector::odomCb, this);
			image_sub = nh_public.subscribe("rectified_image", 1, &HelipadDetector::imageCb, this);

			image_pub = nh_private.advertise<sensor_msgs::Image>("detected_helipad", 1);
			image_pub_preprocess = nh_private.advertise<sensor_msgs::Image>("preprocessed_image", 1);
			pose_pub = nh_private.advertise<detector_msgs::BBPoses>("helipad_position", 1);
		}

		~HelipadDetector(){}
		
		void odomCb(const nav_msgs::Odometry& msg){
			odom = msg;
		}

  		void imageCb(const sensor_msgs::ImageConstPtr& msg){
			cv_bridge::CvImagePtr cv_ptr;
			try
			{
				cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
			}
			catch (cv_bridge::Exception& e)
			{
				ROS_ERROR("cv_bridge exception: %s", e.what());
			}

			frame=cv_ptr->image;
			ROS_ASSERT(frame.empty()!=true);

			int i,n;

			std::vector<std::vector<cv::Point> > list_contours;
			std::vector<double> distances;
			std::vector<double> signature;

			processed_frame = preprocess(frame, threshold, cam_mat, dist_coeff);
			if(publish_preprocess)
			{	
				cv_bridge::CvImage preprocessed_img;
				preprocessed_img.encoding = sensor_msgs::image_encodings::MONO8;
				preprocessed_img.header.stamp = ros::Time::now();
				preprocessed_img.image = processed_frame;
				image_pub_preprocess.publish(preprocessed_img.toImageMsg());
			}

			cv::findContours(processed_frame, list_contours, CV_RETR_LIST, CV_CHAIN_APPROX_NONE);
			
			cv::Point centre_;
			geometry_msgs::Point point_h;

			detector_msgs::BBPose bbpose[1];
			detector_msgs::BBPoses bbposes;			

			for(i=0;i<list_contours.size();i++)
			{
				if(cv::contourArea(list_contours.at(i)) < area_tolerance*frame.size().area())
						continue;
				
				int n = floor(b*list_contours.at(i).size()/2.7);

				distances.clear();
				signature.clear();
								
				pointToLineDistance(list_contours.at(i), distances, n);

				// for(int j=0;j<distances.size();j++)
				// 	distances.at(j) = (cv::norm( list_contours.at(i).at( loc(j+n, distances.size()) )+list_contours.at(i).at( loc(j-n, distances.size()) )-2*list_contours.at(i).at( loc(j, distances.size()) ) ));

				smooth(distances, signature, n);
				
				if(isSimilar(signature,list_contours.at(i), a, b, c, d, signature_tolerance)==1)
				{
					cv::drawContours(frame, list_contours, i, cv::Scalar(0, 0, 255), 2);
					centre_ = centre(signature, list_contours.at(i), frame);
					retrace(signature, list_contours.at(i), frame);
					point_h = findPose(centre_, nh_private, odom);
					bbpose[0].position = point_h;
					bbpose[0].boxID = -1;
					bbpose[0].type = -1;
					bbpose[0].area = 0;
					bbposes.stamp = ros::Time::now();
					bbposes.imageID = -1;
					bbposes.mav_name = mav_name;
					bbposes.object_poses.push_back(bbpose[0]);
					pose_pub.publish(bbposes);
					break;
				}
				// else
				// {
				// 	cv::drawContours(frame, list_contours, i, cv::Scalar(0, 255, 0));
				// }
			}
			
			if (publish_detected_helipad)
			{
				cv_bridge::CvImage Detected_H;
				Detected_H.encoding = sensor_msgs::image_encodings::BGR8;
				Detected_H.header.stamp = ros::Time::now();
				Detected_H.image = frame;
				image_pub.publish(Detected_H.toImageMsg());
			}
		}
};

int main(int argc, char** argv)
{
	ros::init(argc, argv, "hdetect");
  	HelipadDetector hd;
	ros::Rate rate(20);
	while (ros::ok())
	{
		ros::spinOnce();
		rate.sleep();
	}
	return 0;
}
