#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <helipad_det/Preprocess.h>
#include <helipad_det/Signature Processing.h>
#include <helipad_det/Signature Matching.h>

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
			nh.getParam("/helipad_det/low_threshold", lowThreshold);
			nh.getParam("/helipad_det/ratio", ratio);
			nh.getParam("/helipad_det/kernel_size", kernel_size);
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
	    
	    /*preprocess_result=Preprocess(img, lowThreshold, ratio, kernel_size);
	    
	    std::vector<std::vector<cv::Point> > ListContours;
	    std::vector<std::vector<double> > ListDistance;
			std::vector<cv::Vec4i> hierarchy;

			int n;
	    cv::findContours(preprocess_result,ListContours,hierarchy,CV_RETR_LIST,CV_CHAIN_APPROX_NONE);
			for(unsigned int i = 0; i< ListContours.size();i++){
					n = round(cv::arcLength(ListContours.at(i), true)/(26*3));
					pointToLineDistance(ListContours.at(i), ListDistance[i]);
			}*/

	    ROS_ASSERT(img.empty()!=true);
    	// cv::imshow("img", img);
    	cv::Mat prepro_img = Preprocess(img, lowThreshold, ratio, kernel_size);

    	

    	//cv::imshow("Preprocessed Image", prepro_img);
    	//cv::waitKey(0);
    	//cv::destroyAllWindows();
    	std::vector<std::vector<cv::Point> > ListContours;

    	std::vector<cv::Vec4i> hierarchy;
    	cv::findContours(prepro_img, ListContours, hierarchy, CV_RETR_LIST, CV_CHAIN_APPROX_NONE);
		std::vector<std::vector<double> > ListDistance(ListContours.size());
		int number=0;
    	for(int i=0;i<ListContours.size();i++)
    	{
        	cv::Mat img_tmp;
        	img_tmp = img.clone();
        	pointToLineDistance(ListContours.at(i), ListDistance.at(i));
        	std::vector<double> temp(ListDistance.at(i).size());
        	smooth(ListDistance.at(i), temp);
        	//graph(temp, "Refined Graph");
        	if(isSimilar(temp)==1)
        	{
            	std::cout << "CHAAP-ED " << number << std::endl;
							number++;
							number = number % 200;
            	cv::drawContours(img_tmp, ListContours, i, cv::Scalar(255, 0, 255));
        		Retrace(temp, ListContours.at(i), img_tmp);
        	}
        cv::cvtColor(prepro_img,img_tmp,CV_GRAY2BGR);
	    cv_bridge::CvImage Can_img;
 		Can_img.header.stamp = ros::Time::now();
 		Can_img.encoding = sensor_msgs::image_encodings::BGR8;
 		Can_img.image = img_tmp;
 		image_pub.publish(Can_img.toImageMsg());
        //cv::imshow("contours", img_tmp);
        //if((char)cv::waitKey(0)=='q')
            //return -1;
        //cv::destroyAllWindows();	
        ros::spinOnce();
        // for(int j=0;j<temp.size();j++)
        //     std::cout << temp.at(j) << std::endl;
        // std::cout << std::endl << std::endl;
    	}
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
