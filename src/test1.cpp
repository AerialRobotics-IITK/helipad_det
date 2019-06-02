#include <ros/ros.h>
#include <helipad_det/Preprocess.h>
#include <helipad_det/Distance.h>
#include <helipad_det/Normalize.h>
#include <opencv2/opencv.hpp>

int main(int argc, char** argv)
{
    ros::init(argc, argv, "test1");
    ros::NodeHandle param_get;
    int canny_lowThres=10, ratio=3, kernel_size=3, i;
    param_get.getParam("/helipad_det/low_threshold", canny_lowThres);
    param_get.getParam("/helipad_det/ratio", ratio);
    param_get.getParam("/helipad_det/kernel_size", kernel_size);
    cv::Mat img = cv::imread("etc/img.png");
    ROS_ASSERT(img.empty()!=true);
    cv::imshow("img", img);
    cv::Mat prepro_img = Preprocess(img, canny_lowThres, ratio, kernel_size);
    cv::imshow("Preprocessed Image", prepro_img);
    cv::waitKey(0);
    cv::destroyAllWindows();
    std::vector<std::vector<cv::Point> > ListContours;
    std::vector<cv::Vec4i> hierarchy;
    cv::findContours(prepro_img, ListContours, hierarchy, CV_RETR_LIST, CV_CHAIN_APPROX_NONE);
	std::vector<std::vector<double> > ListDistance(ListContours.size());
    for(i=0;i<ListContours.size();i++)
    {
        pointToLineDistance(ListContours.at(i), ListDistance.at(i));
        std::vector<double> temp(ListDistance.at(i).size());
        smooth(ListDistance.at(i), temp);
        graph(temp);
        // for(int j=0;j<temp.size();j++)
        //     std::cout << temp.at(j) << std::endl;
        // std::cout << std::endl << std::endl;
    }
}