#include <opencv2/opencv.hpp>
#include<ros/ros.h>

cv::Mat Preprocess(const cv::Mat& img, int canny_lowThreshold, int canny_ratio, int canny_kernel_size){
    ROS_ASSERT(img.empty()!=true);

    cv::Mat gray, HSV, blur, result_hsv, result, erode, dilate;

    //cv::cvtColor(img,HSV,CV_BGR2HSV);
    cv::cvtColor(img,gray,CV_BGR2GRAY);
    cv::GaussianBlur(gray, blur, cv::Size(5, 5), 0, 0);
    cv::adaptiveThreshold(blur,result,255,CV_ADAPTIVE_THRESH_GAUSSIAN_C, CV_THRESH_BINARY_INV, 75, 10);
    
    // cv::Mat Element = getStructuringElement (cv::MORPH_RECT,cv::Size(3,3), cv::Point(1,1));
    
    // cv::Mat Element_Dilate = getStructuringElement(CV_MORPH_DILATE, cv::Size(11, 11), cv::Point(5, 5));
    
    // cv::dilate(result, dilate, Element);
    // cv::erode(dilate, erode, Element);

    //cv:Canny(result_hsv, result, canny_lowThreshold, canny_lowThreshold*canny_ratio, canny_kernel_size);

    // std::vector<cv::Vec4i> linesP;
    // cv::HoughLinesP(canny, linesP, 1, CV_PI/180, 10, 50, 10);
    // for( size_t i = 0; i < linesP.size(); i++ )
    // {
    //     cv::Vec4i l = linesP[i];
    //     cv::line( canny, cv::Point(l[0], l[1]), cv::Point(l[2], l[3]), cv::Scalar(0,0,255), 3);
    // }
    return result;
}