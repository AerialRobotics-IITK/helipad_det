#include <opencv2/opencv.hpp>
#include<ros/ros.h>

cv::Mat Preprocess(const cv::Mat& img, int canny_lowThreshold, int canny_ratio, int canny_kernel_size){
    ROS_ASSERT(img.empty()!=true);

    cv::Mat gray, blur, result;

    cv::cvtColor(img,gray,CV_BGR2GRAY);
    cv::GaussianBlur(gray, blur, cv::Size(5, 5), 0, 0);
    cv::adaptiveThreshold(blur,result,255,CV_ADAPTIVE_THRESH_GAUSSIAN_C, CV_THRESH_BINARY_INV, 75, 10);
    cv::Mat Element = getStructuringElement (cv::MORPH_RECT,cv::Size(3,3));
    cv::morphologyEx(result, result, CV_MOP_OPEN, Element);

    //cv:Canny(result_hsv, result, canny_lowThreshold, canny_lowThreshold*canny_ratio, canny_kernel_size);
    return result;
}