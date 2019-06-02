#include <ros/ros.h>
#include <opencv2/opencv.hpp>
#include <math.h>
#include <iostream>

void smooth(std::vector<double>& input, std::vector<double>& output){
    ROS_ASSERT(input.size()==output.size());
    int i;
    for(int i=0;i<output.size();i++)
        output[i]=0;

    if(input[0]>input[1] && input[0]>=1)
        output[0]=input[0];

    if(input[input.size()-1]>input[input.size()-2] && input[input.size()-1]>=1)
        output[input.size()-1]=input[input.size()-1];

    if(output[0]!=0 && output[input.size()-1]!=0)
    {
        if(output[0]>output[input.size()-1])
            output[input.size()-1]=0;
        else
            output[0]=0;        
    }

    for(i=1;i<input.size()-1;i++)
    {
        if(input[i]>input[i+1] && input[i]>input[i-1] && input[i]>=1)
            output[i]=input[i];
        else
            output[i]=0;
    }
}

void normalize(std::vector<double>& input, std::vector<double>& output, int n){
    int i;
    for(i=0;i<input.size();i++)
    {
        if(input[i]==0)
            output[i]=3.1416;
        else
            output[i]=asin((2*input[i]*sqrt(n*n-input[i]*input[i]))/(n*n));
    }
}

void graph(std::vector<double>& signature)
{
    int size = signature.size();
    cv::Mat graph(1.1*size, 1.1*size, CV_8UC3);
    cv::line(graph, cv::Point2d(0, size), cv::Point2d(1.1*size, size), cv::Scalar(255, 255, 255));
    cv::line(graph, cv::Point2d(size*0.1, 0), cv::Point2d(size*0.1, size*1.1), cv::Scalar(255, 255, 255));
    for(int i=0;i<size;i++)
    {
        cv::circle(graph, cv::Point2d(0.1*size+i, size-0.1*size*signature.at(i)), 3, cv::Scalar(255, 0, 0), -1);
    }
    cv::imshow("Plot of Signature", graph);
    cv::waitKey(250);
    cv::waitKey(0);
}