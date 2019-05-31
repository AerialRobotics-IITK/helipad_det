#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <helipad_det/Preprocess.h>

	int lowThreshold;
  	int ratio;
	int kernel_size;

class ImageConverter{
	ros::NodeHandle nh;
	image_transport::ImageTransport it_;
	image_transport::Subscriber image_sub;
	image_transport::Publisher image_pub;
	ros::Publisher obj_pub;
	cv::Mat img, preprocess_result, result;

	public:
	  ImageConverter()
	    : it_(nh)
	  {
	    // Subscribe to input video feed and publish output video feed
	    image_sub = it_.subscribe("usb_cam/image_raw", 1,
	      &ImageConverter::imageCb, this);
	    image_pub = it_.advertise("threshold_image", 1);
			nh.getParam("/hdetect/low_threshold", lowThreshold);
			nh.getParam("/hdetect/ratio", ratio);
			nh.getParam("/hdetect/kernel_size", kernel_size);
	  }

	  ~ImageConverter(){}

  	void imageCb(const sensor_msgs::ImageConstPtr& msg)
  	{
  		cv_bridge::CvImagePtr cv_ptr;
	    try
	    {
	      cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
	    }
	    catch (cv_bridge::Exception& e)
	    {
	      ROS_ERROR("cv_bridge exception: %s", e.what());
	    }

	    img=cv_ptr->image;
	    
	    preprocess_result=Preprocess(img, lowThreshold, ratio, kernel_size);
	    
	    std::vector<std::vector<cv::Point> > ListContours;
	    std::vector<cv::Vec4i> hierarchy;
	    cv::findContours(preprocess_result,ListContours,hierarchy,CV_RETR_LIST,CV_CHAIN_APPROX_NONE);

	    
	    cv::cvtColor(preprocess_result,result,CV_GRAY2BGR);
	    cv_bridge::CvImage Can_img;
 		Can_img.header.stamp = ros::Time::now();
 		Can_img.encoding = sensor_msgs::image_encodings::BGR8;
 		Can_img.image = result;
 		image_pub.publish(Can_img.toImageMsg());
      return;
  	}


};
int main(int argc, char** argv)
{
  ros::init(argc, argv, "threshold");
  ImageConverter ic;
  ros::spin();
  return 0;
}
