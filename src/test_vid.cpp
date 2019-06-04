#include <ros/ros.h>
#include <helipad_det/Preprocess.h>
#include <helipad_det/Signature Processing.h>
#include <helipad_det/isSimilar.h>
#include <opencv2/opencv.hpp>

int main(int argc, char** argv)
{
    ros::init(argc, argv, "test1");
    ros::NodeHandle param_get;
    int canny_lowThres, ratio, kernel_size, i;
    param_get.getParam("/helipad_det/low_threshold", canny_lowThres);
    param_get.getParam("/helipad_det/ratio", ratio);
    param_get.getParam("/helipad_det/kernel_size", kernel_size);
    return 0;
}