#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>

cv::Mat img, blur, canny, gray, result;
cv::Mat src, src_gray;
cv::Mat dst, detected_edges;
int edgeThresh = 1;
int lowThreshold=25;
int const max_lowThreshold = 100;
int ratio = 3;
int kernel_size = 3;


class ImageConverter{
	ros::NodeHandle nh;
	image_transport::ImageTransport it_;
	image_transport::Subscriber image_sub;
	image_transport::Publisher image_pub;
	ros::Publisher obj_pub;

	public:
	  ImageConverter()
	    : it_(nh)
	  {
	    // Subscribe to input video feed and publish output video feed
	    image_sub = it_.subscribe("usb_cam/image_raw", 1,
	      &ImageConverter::imageCb, this);
	    image_pub = it_.advertise("threshold_image", 1);
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
	    cv::cvtColor(img,gray,CV_BGR2GRAY);
	    cv::GaussianBlur(gray, blur, cv::Size(5,5), 0, 0);
	    cv::Canny(blur, canny, lowThreshold, lowThreshold*ratio, kernel_size);
	
	    cv::cvtColor(canny,result,CV_GRAY2BGR);
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