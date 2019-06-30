#ifndef HELIPAD_DET_PREPROCESS_H
#define HELIPAD_DET_PREPROCESS_H

#include <ros/ros.h>
#include <opencv2/opencv.hpp>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/Image.h>
#include <sensor_msgs/image_encodings.h>
#include <tf/LinearMath/Quaternion.h>
#include <eigen3/Eigen/Dense>
#include <eigen3/Eigen/Core>
#include <nav_msgs/Odometry.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/PoseStamped.h>
#include <detector_msgs/BBPose.h>
#include <detector_msgs/BBPoses.h>

#define exit flag==-1
#define run flag==1

int flag = 1;

double crossProduct(cv::Point, cv::Point, cv::Point);
double baseLength(cv::Point, cv::Point);
void pointToLine(const std::vector<cv::Point>&, std::vector<double>&);
void smooth(const std::vector<double>&, std::vector<double>&);
void graph(const std::vector<double>&, cv::String);
void retrace(const std::vector<double>&, const std::vector<cv::Point>&, cv::Mat&);
cv::Point centre(const std::vector<double>&, const std::vector<cv::Point>&, cv::Mat&);
int loc(int, int);

cv::Mat preprocess(cv::Mat& img, int threshold, std::vector<double>& cam_mat,std::vector<double>& dist_coeff){
    ROS_ASSERT(img.empty()!=true);
    
    cv::Mat img_, gray, blur, result;

    int tempIdx=0;
    cv::Mat intrinsic = cv::Mat_<double>(3, 3);
    cv::Mat dist_coeff_ = cv::Mat_<double>(1,5);
    
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            intrinsic.at<double>(i, j) = cam_mat.at(tempIdx++);
        }
    }

    for(int i=0;i<5;i++)
    {
        dist_coeff_.at<double>(i) = dist_coeff[i];
    }

    cv::undistort(img, img_, intrinsic, dist_coeff_);
    img = img_.clone();
    cv::cvtColor(img,gray,CV_BGR2GRAY);
    cv::GaussianBlur(gray, blur, cv::Size(3, 3), 0, 0);
    // double time = (double) cv::getTickCount();
    cv::threshold(blur, result, threshold, 255, CV_THRESH_BINARY_INV);
    // cv::adaptiveThreshold(blur, result, 255, CV_ADAPTIVE_THRESH_GAUSSIAN_C, CV_THRESH_BINARY_INV, 101, 5);
    // std::cout << "TIME TAKEN THRESHOLD=" << ((double)cv::getTickCount()-time)/cv::getTickFrequency() << std::endl;

    cv::Mat Element = getStructuringElement (cv::MORPH_RECT,cv::Size(3,3));
    cv::morphologyEx(result, result, CV_MOP_OPEN, Element);

    cv:Canny(result, result, 100, 100*3, 3);
    
    return result;
}

#endif