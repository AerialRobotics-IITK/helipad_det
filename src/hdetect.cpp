#include <helipad_det/preprocess.h>
#include <helipad_det/signature_processing.h>
#include <helipad_det/signature_matching.h>
#include <helipad_det/pose_estimation.h>

class HelipadDetector{
	private:
		ros::NodeHandle nh_private;
		ros::NodeHandle nh_public;
		image_transport::ImageTransport it_private;
		image_transport::ImageTransport it_public;

		ros::Publisher pose_pub;
		ros::Subscriber odom_sub;

		image_transport::Subscriber image_sub;
		image_transport::Publisher image_pub;
		image_transport::Publisher image_pub_preprocess;

		int canny_lowThres, ratio, kernel_size;
		double a, b, c, d, signature_tolerance, area_tolerance;

		nav_msgs::Odometry odom;

		std::vector<double> cam_mat;
		std::vector<double> dist_coeff;

		cv::Mat frame, processed_frame, result;
	
	public:
	  	HelipadDetector():nh_private("~"), it_private(nh_private), nh_public(), it_public(nh_public){  
			// Subscribe to input video feed and publish output video feed

			odom_sub = nh_public.subscribe("odometry", 1, &HelipadDetector::odomCb, this);
			image_sub = it_public.subscribe("usb_cam/image_raw", 1, &HelipadDetector::imageCb, this);

			image_pub = it_private.advertise("detected_helipad", 1);
			image_pub_preprocess = it_private.advertise("preprocessed_image", 1);
			pose_pub = nh_private.advertise<geometry_msgs::Point>("helipad_position", 1);

			nh_private.getParam("low_threshold", canny_lowThres);
			nh_private.getParam("ratio", ratio);
			nh_private.getParam("kernel_size", kernel_size);
			nh_private.getParam("a", a);
			nh_private.getParam("b", b);
			nh_private.getParam("c", c);
			nh_private.getParam("d", d);
			nh_private.getParam("signature_tolerance", signature_tolerance);
			nh_private.getParam("area_tolerance", area_tolerance);
			nh_private.getParam("camera_matrix/data", cam_mat);
			nh_private.getParam("distortion_coefficients/data", dist_coeff);
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

			int i;

			std::vector<std::vector<cv::Point> > list_contours;
			std::vector<double> distances;
			std::vector<double> signature;

			processed_frame = preprocess(frame, canny_lowThres, ratio, kernel_size, cam_mat, dist_coeff);
			
			cv_bridge::CvImage preprocessed_img;
			preprocessed_img.encoding = sensor_msgs::image_encodings::MONO8;
			preprocessed_img.header.stamp = ros::Time::now();
			preprocessed_img.image = processed_frame;
			image_pub_preprocess.publish(preprocessed_img.toImageMsg());

			cv::findContours(processed_frame, list_contours, CV_RETR_LIST, CV_CHAIN_APPROX_NONE);
			
			cv::Point Centre;

			for(i=0;i<list_contours.size();i++)
			{
				if(cv::contourArea(list_contours.at(i)) < area_tolerance*frame.size().area())
						continue;
				
				distances.clear();
				signature.clear();

				pointToLineDistance(list_contours.at(i), distances, b);        
				smooth(distances, signature, b);
				
				if(isSimilar(signature,list_contours.at(i), a, b, c, d, signature_tolerance)==1)
				{
					// std::cout << odom.pose.pose.position.z << " " << odom.pose.pose.orientation.w << std::endl;	{
					cv::drawContours(frame, list_contours, i, cv::Scalar(255, 0, 255));
					Centre = centre(signature, list_contours.at(i), frame);
					// pose_pub.publish(findPose(Centre, nh, odom));
					break;
				}
			}
			cv_bridge::CvImage Detected_H;
			Detected_H.encoding = sensor_msgs::image_encodings::BGR8;
			Detected_H.header.stamp = ros::Time::now();
			Detected_H.image = frame;
			image_pub.publish(Detected_H.toImageMsg());
		}
};

int main(int argc, char** argv)
{
	ros::init(argc, argv, "hdetect");
  	HelipadDetector hd;
  	ros::spin();
	return 0;
}