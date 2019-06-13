#ifndef HELIPAD_DET_PREPROCESS_H
#define HELIPAD_DET_PREPROCESS_H

#include <ros/ros.h>
#include <opencv2/opencv.hpp>
#include <cv_bridge/cv_bridge.h>
#include <image_transport/image_transport.h>
#include <sensor_msgs/image_encodings.h>
#include <tf/LinearMath/Quaternion.h>
#include <Eigen/Dense>
#include <Eigen/Core>
#include <nav_msgs/Odometry.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/PoseStamped.h>

double crossProduct(cv::Point, cv::Point, cv::Point);
double baseLength(cv::Point, cv::Point);
void pointToLine(const std::vector<cv::Point>&, std::vector<double>&);
void smooth(const std::vector<double>&, std::vector<double>&);
void graph(const std::vector<double>&, cv::String);
void retrace(const std::vector<double>&, const std::vector<cv::Point>&, cv::Mat);
cv::Point centre(const std::vector<double>&, const std::vector<cv::Point>&, cv::Mat);

cv::Mat preprocess(const cv::Mat& img, int canny_lowThreshold, int canny_ratio, int canny_kernel_size){
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

#endif