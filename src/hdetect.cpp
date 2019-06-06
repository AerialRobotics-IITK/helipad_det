#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <opencv2/opencv.hpp>
#include <helipad_det/Preprocess.h>
#include <helipad_det/Signature Processing.h>
#include <helipad_det/Signature Matching.h>

int canny_lowThres;
int ratio;
int kernel_size;

class ImageConverter{
	ros::NodeHandle nh;
	image_transport::ImageTransport it_;
	image_transport::Subscriber image_sub;
	image_transport::Publisher image_pub;
	image_transport::Publisher image_pub_canny;
	ros::Publisher obj_pub;
	cv::Mat frame, processed_frame, result;

	public:
	  	ImageConverter():it_(nh){  
	     // Subscribe to input video feed and publish output video feed
	    image_sub = it_.subscribe("usb_cam/image_raw", 1,&ImageConverter::imageCb, this);
	    image_pub = it_.advertise("threshold_image", 1);
	    image_pub_canny = it_.advertise("canny_image", 1);
		nh.param("low_threshold", canny_lowThres, 50);
		nh.param("ratio", ratio, 3);
		nh.param("kernel_size", kernel_size, 3);
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
			int i,count=0;
			std::vector<std::vector<cv::Point> > ListContours;
			std::vector<double> Distances;
			std::vector<double> Signature;
			// while (ros::ok())
			// {
				// frame=cv::imread("etc/Refined H.png");
				ROS_ASSERT(frame.empty()!=true);
				processed_frame = Preprocess(frame, canny_lowThres, ratio, kernel_size);
				cv_bridge::CvImage Canny;
				Canny.encoding = sensor_msgs::image_encodings::MONO8;
				Canny.header.stamp = ros::Time::now();
				Canny.image = processed_frame;
				cv::findContours(processed_frame, ListContours, CV_RETR_LIST, CV_CHAIN_APPROX_NONE);

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
					if(isSimilar(Signature)==1)
					{
						count++;
						std::cout << "CHAAP-ED" << count << std::endl;
						cv::drawContours(frame, ListContours, i, cv::Scalar(255, 0, 255));
						centre(Signature, ListContours.at(i), frame);
						break;
					}
				}
				// cv::imshow("Detected H", frame);
				cv_bridge::CvImage Detected_H;
				Detected_H.encoding = sensor_msgs::image_encodings::BGR8;
				Detected_H.header.stamp = ros::Time::now();
				Detected_H.image = frame;
				image_pub_canny.publish(Canny.toImageMsg());
				image_pub.publish(Detected_H.toImageMsg());
				cv::waitKey(30);
				ros::spinOnce();
			// }
		}
};
			// preprocess_result=Preprocess(img, lowThreshold, ratio, kernel_size);
	    
	    // std::vector<std::vector<cv::Point> > ListContours;
// 			std::vector<cv::Vec4i> hierarchy;

// 			int n;
// 	    cv::findContours(preprocess_result,ListContours,hierarchy,CV_RETR_LIST,CV_CHAIN_APPROX_NONE);
// 			for(unsigned int i = 0; i< ListContours.size();i++){
// 					n = round(cv::arcLength(ListContours.at(i), true)/(26*3));
// 					pointToLineDistance(ListContours.at(i), ListDistance[i]);
// 			}*/

// 	    ROS_ASSERT(img.empty()!=true);
//     	// cv::imshow("img", img);
//     	cv::Mat prepro_img = Preprocess(img, lowThreshold, ratio, kernel_size);

    	

//     	//cv::imshow("Preprocessed Image", prepro_img);
//     	//cv::waitKey(0);
//     	//cv::destroyAllWindows();
//     	std::vector<std::vector<cv::Point> > ListContours;

//     	std::vector<cv::Vec4i> hierarchy;


//     	cv::Mat img_tmp;
//     	cv::findContours(prepro_img, ListContours, hierarchy, CV_RETR_LIST, CV_CHAIN_APPROX_NONE);
// 		std::vector<std::vector<double> > ListDistance(ListContours.size());
// 		cv::cvtColor(prepro_img, img_tmp, CV_GRAY2BGR);

//  		cv::Mat ContoursDraw;

//     	for(int i=0;i<ListContours.size();i++)
//     	{
//         	if (ListContours.at(i).size() < 1000) continue;
//         	img_tmp = img.clone();
//         	pointToLineDistance(ListContours.at(i), ListDistance.at(i));
//         	std::vector<double> temp(ListDistance.at(i).size());
//         	smooth(ListDistance.at(i), temp);
//         	//graph(temp, "Refined Graph");
//         	if(isSimilar(temp)==1)
//         	{
//             	std::cout << "CHAAP-ED " << number << std::endl;
// 				number++;	
// 				if (number==1000) number=0;	

//             	cv::drawContours(ContoursDraw, ListContours, i, cv::Scalar(255, 0, 255));
//         		//Retrace(temp, ListContours.at(i), img_tmp);
//         	}

//         //cv::imshow("contours", img_tmp);
//         //if((char)cv::waitKey(0)=='q')
//             //return -1;
//         //cv::destroyAllWindows();	

//         cv_bridge::CvImage Can_img;
//  		Can_img.header.stamp = ros::Time::now();
//  		Can_img.encoding = sensor_msgs::image_encodings::BGR8;
//  		Can_img.image = ContoursDraw;
//  		image_pub.publish(Can_img.toImageMsg());
//         ros::spinOnce();
//         // for(int j=0;j<temp.size();j++)
//         //     std::cout << temp.at(j) << std::endl;
//         // std::cout << std::endl << std::endl;
//     	}
//     	ros::spinOnce();
//       return;
//   	}


// };

int main(int argc, char** argv)
{
  ros::init(argc, argv, "threshold");
  ImageConverter ic;
  ros::spin();
  return 0;
}