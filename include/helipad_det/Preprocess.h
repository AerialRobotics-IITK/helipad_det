#include <opencv2/opencv.hpp>

cv::Mat Preprocess(const cv::Mat& img, int canny_lowThreshold, int canny_ratio, int canny_kernel_size){
    cv::Mat gray, blur, result;
    // std::vector<cv::Vec4i> linesP;
    cv::cvtColor(img,gray,CV_BGR2GRAY);
    cv::GaussianBlur(gray, blur, cv::Size(5,5), 0, 0);
    cv::Canny(blur, result, canny_lowThreshold, canny_lowThreshold*canny_ratio, canny_kernel_size);
    // cv::HoughLinesP(canny, linesP, 1, CV_PI/180, 10, 50, 10);
    // for( size_t i = 0; i < linesP.size(); i++ )
    // {
    //     cv::Vec4i l = linesP[i];
    //     cv::line( canny, cv::Point(l[0], l[1]), cv::Point(l[2], l[3]), cv::Scalar(0,0,255), 3);
    // }
    return result;
}
