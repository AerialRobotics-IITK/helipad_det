#include <ros/ros.h>
#include <helipad_det/Preprocess.h>
#include <helipad_det/Signature Processing.h>
#include <helipad_det/Signature Matching.h>
#include <opencv2/opencv.hpp>

int main(int argc, char** argv)
{
    ros::init(argc, argv, "test1");
    ros::NodeHandle param_get;
    int canny_lowThres, ratio, kernel_size, i;
    param_get.getParam("/helipad_det/low_threshold", canny_lowThres);
    param_get.getParam("/helipad_det/ratio", ratio);
    param_get.getParam("/helipad_det/kernel_size", kernel_size);
    cv::Mat img = cv::imread("/home/kabeer/H_det/src/helipad_det/etc/Refined H.png");
    ROS_ASSERT(img.empty()!=true);
    // cv::imshow("img", img);
    cv::Mat prepro_img = Preprocess(img, canny_lowThres, ratio, kernel_size);
    cv::imshow("Preprocessed Image", prepro_img);
    cv::waitKey(0);
    cv::destroyAllWindows();
    std::vector<std::vector<cv::Point> > ListContours;
    cv::findContours(prepro_img, ListContours, CV_RETR_LIST, CV_CHAIN_APPROX_NONE);
	std::vector<double> Distances;
    for(i=0;i<ListContours.size();i++)
    {
        cv::Mat img_tmp;
        img_tmp = img.clone();
        pointToLineDistance(ListContours.at(i), Distances);
        std::vector<double> temp(Distances.size());
        smooth(Distances, temp);
        graph(temp, "Refined Graph");
        if(isSimilar(temp)==1)
            std::cout << "CHAAP-ED" << std::endl;
        cv::drawContours(img_tmp, ListContours, i, cv::Scalar(255, 0, 255));
        Retrace(temp, ListContours.at(i), img_tmp);
        cv::imshow("contours", img_tmp);
        if((char)cv::waitKey(0)=='q')
            return -1;
        Distances.clear();
        cv::destroyAllWindows();
        ros::spinOnce();
        for(int j=0;j<temp.size();j++)
            std::cout << temp.at(j) << std::endl;
        std::cout << std::endl << std::endl;
    }
    return 0;
}