#include <opencv2/opencv.hpp>
cv::Mat Preprocess(const cv::Mat& img, int canny_lowThreshold, int canny_ratio, int canny_kernel_size){
    int h_max = 180, h_min = 0;
    int s_max = 50, s_min = 0;
    int v_max = 80, v_min = 0;
    cv::Mat gray, HSV, blur, result_hsv, result, erode, dilate;
    std::vector<cv::Vec4i> linesP;

    //cv::cvtColor(img,HSV,CV_BGR2HSV);
    //cv::GaussianBlur(HSV, blur, cv::Size(7, 7), 0, 0);
    cv::cvtColor(img,gray,CV_BGR2GRAY);
    cv::adaptiveThreshold(gray,result,255,CV_ADAPTIVE_THRESH_GAUSSIAN_C, CV_THRESH_BINARY, 75, 10);
    cv::Mat Element = getStructuringElement (cv::MORPH_RECT,cv::Size(3,3), cv::Point(1,1));
    //cv::Mat Element_Dilate = getStructuringElement(CV_MORPH_DILATE, cv::Size(11, 11), cv::Point(5, 5));
    cv::dilate(result, dilate, Element);
    cv::erode(dilate, erode, Element);
    //ROS_ASSERT(result_hsv.empty()!=true);

    //cv:Canny(result_hsv, result, canny_lowThreshold, canny_lowThreshold*canny_ratio, canny_kernel_size);

    
    // cv::HoughLinesP(canny, linesP, 1, CV_PI/180, 10, 50, 10);
    // for( size_t i = 0; i < linesP.size(); i++ )
    // {
    //     cv::Vec4i l = linesP[i];
    //     cv::line( canny, cv::Point(l[0], l[1]), cv::Point(l[2], l[3]), cv::Scalar(0,0,255), 3);
    // }
    return erode;
}
