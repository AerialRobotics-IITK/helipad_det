#include <opencv2/opencv.hpp>

<<<<<<< HEAD
cv::Mat Preprocess(cv::Mat img, int canny_lowThreshold, int canny_ratio, int canny_kernel_size){
    int h_max=255, h_min=0;
    int s_max=255, s_min=0;
    int v_max=25, v_min=0;

    cv::Mat HSV, blur, result_hsv, result;
=======
cv::Mat Preprocess(const cv::Mat& img, int canny_lowThreshold, int canny_ratio, int canny_kernel_size){
    cv::Mat gray, blur, result;
>>>>>>> 7b7f0c79d3bc160fcdecc5a309f752e89a26bea2
    std::vector<cv::Vec4i> linesP;

    cv::GaussianBlur(img, blur, cv::Size(5,5), 0, 0);
    cv::cvtColor(blur,HSV,CV_BGR2HSV);

    //cv::inRange(HSV,cv::Scalar(h_min,s_min,v_min),cv::Scalar(h_max,s_max,v_max),result_hsv);
    //ROS_ASSERT(result_hsv.empty()!=true);

    cv:Canny(blur, result, canny_lowThreshold, canny_lowThreshold*canny_ratio, canny_kernel_size);

    
    // cv::HoughLinesP(canny, linesP, 1, CV_PI/180, 10, 50, 10);
    // for( size_t i = 0; i < linesP.size(); i++ )
    // {
    //     cv::Vec4i l = linesP[i];
    //     cv::line( canny, cv::Point(l[0], l[1]), cv::Point(l[2], l[3]), cv::Scalar(0,0,255), 3);
    // }
    return result/*_hsv*/;
}