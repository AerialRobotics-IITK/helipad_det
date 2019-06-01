#include <opencv2/opencv.hpp>

cv::Mat Preprocess(cv::Mat img, int canny_lowThreshold, int canny_ratio, int canny_kernel_size){
    cv::Mat gray, blur, canny;

    cv::cvtColor(img,gray,CV_BGR2GRAY);
    cv::GaussianBlur(gray, blur, cv::Size(5,5), 0, 0);
    cv::Canny(blur, canny, canny_lowThreshold, canny_lowThreshold*canny_ratio, canny_kernel_size);

    return canny;
}