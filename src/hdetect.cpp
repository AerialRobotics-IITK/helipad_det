#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <opencv2/opencv.hpp>
#include <helipad_det/preprocess.h>
#include <helipad_det/signProc.h>
#include <helipad_det/signMatch.h>
#include <helipad_det/PoseEstimation.h>

int canny_lowThres;
int ratio;
int kernel_size;
double a,b,c,d,tolerance;
// nav_msgs::Odometry odom;

// void odomCb(const nav_msgs::Odometry& msg){
// 	odom = msg;
// }

class ImageConverter{
	private:
		ros::NodeHandle nh;
		image_transport::ImageTransport it_;
		image_transport::Subscriber image_sub;
		image_transport::Publisher image_pub;
		image_transport::Publisher image_pub_preprocess;
		ros::Publisher Pose_pub;
		ros::Publisher obj_pub;
		ros::Subscriber Odom_sub;
		cv::Mat frame, processed_frame, result;
	
	public:
	  	ImageConverter():it_(nh){  
			// Subscribe to input video feed and publish output video feed
			image_sub = it_.subscribe("usb_cam/image_raw", 1,&ImageConverter::imageCb, this);
			// Odom_sub = nh.subscribe("Odometry",100,odomCb);
			image_pub = it_.advertise("Detected_H", 1);
			image_pub_preprocess = it_.advertise("Preprocessed_image", 1);
			Pose_pub = nh.advertise<geometry_msgs::Point>("H_position",1);
			nh.getParam("low_threshold", canny_lowThres);
			nh.getParam("ratio", ratio);
			nh.getParam("kernel_size", kernel_size);
			nh.getParam("a",a);
			nh.getParam("b",b);
			nh.getParam("c",c);
			nh.getParam("d",d);
			nh.getParam("tolerance",tolerance);
		}

		~ImageConverter(){}

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
			std::vector<std::vector<cv::Point> > ListContours;
			std::vector<double> Distances;
			std::vector<double> Signature;

			processed_frame = Preprocess(frame, canny_lowThres, ratio, kernel_size);
			
			cv_bridge::CvImage Preprocessed_img;
			Preprocessed_img.encoding = sensor_msgs::image_encodings::MONO8;
			Preprocessed_img.header.stamp = ros::Time::now();
			Preprocessed_img.image = processed_frame;
			
			cv::findContours(processed_frame, ListContours, CV_RETR_LIST, CV_CHAIN_APPROX_NONE);
			
			cv::Point Centre;

			for(i=0;i<ListContours.size();i++)
			{
				if(cv::contourArea(ListContours.at(i)) < 0.01*frame.size().area())
						continue;
				Distances.clear();
				Signature.clear();
				pointToLineDistance(ListContours.at(i), Distances);
				for(int j=0;j<Distances.size();j++)
						Signature.push_back(0);            
				smooth(Distances, Signature);
				if(isSimilar(Signature,a,b,c,d,tolerance)==1)
				{
					cv::drawContours(frame, ListContours, i, cv::Scalar(255, 0, 255));
					Centre = centre(Signature, ListContours.at(i), frame);
					std::cout << Centre.x << " " << Centre.y << std::endl;
					break;
				}
			}
			cv_bridge::CvImage Detected_H;
			Detected_H.encoding = sensor_msgs::image_encodings::BGR8;
			Detected_H.header.stamp = ros::Time::now();
			Detected_H.image = frame;
			image_pub_preprocess.publish(Preprocessed_img.toImageMsg());
			image_pub.publish(Detected_H.toImageMsg());
			// geometry_msgs::Point Position = findPose (Centre,nh,odom);
			// Pose_pub.publish(Position);
			ros::spinOnce();
		}
};

int main(int argc, char** argv)
{
  ros::init(argc, argv, "hdetect");
  ImageConverter ic;
  ros::spin();
  return 0;
}