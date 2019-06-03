#include <ros/ros.h>
#include <opencv2/opencv.hpp>
#include <math.h>
#include <iostream>

void smooth(std::vector<double>& input, std::vector<double>& output){
    ROS_ASSERT(input.size()==output.size());
    int i;
    for(int i=0;i<output.size();i++)
        output[i]=0;

    if(input[0]>input[1] && input[0]>input[input.size()-1] && input[0]>=1)
        output[0]=input[0];

    if(input[input.size()-1]>input[input.size()-2] && input[input.size()-1]> input[0] && input[input.size()-1]>=1)
        output[input.size()-1]=input[input.size()-1];

    for(i=1;i<input.size()-1;i++)
    {
        if(input[i]>input[i+1] && input[i]>input[i-1] && input[i]>=1)
            output[i]=input[i];
        else
            output[i]=0;
    }
    int n=round(input.size()/(26*3));
    int x0, y0, count;
    for(i = n;i<output.size()-n;i++)
    {
        if(output.at(i)==0)
            continue;
        else
        {
            x0 = 0;
            y0 = 0;
            count = 0;
            for(int j=i-n;j<=i+n;j++)
            {
                if(output.at(j)==0)
                    continue;
                else
                {
                    count++;
                    x0 += j;
                    if(output.at(j)>y0)
                        y0=output.at(j);
                    output.at(j)=0;
                }
            }
            output.at(round(x0/count))=y0;
        }
    }
}

// void normalize(std::vector<double>& input, std::vector<double>& output, int n){   //DO NOT USE
//     int i;
//     for(i=0;i<input.size();i++)
//     {
//         if(input[i]==0)
//             output[i]=3.1416;
//         else
//             output[i]=asin((2*input[i]*sqrt(n*n-input[i]*input[i]))/(n*n));
//     }
// }

void graph(std::vector<double>& signature, cv::String str){
    int size = signature.size(), max=0;
    for(int i=0;i<size;i++)
        if(signature.at(i)>max)max=signature.at(i);
    cv::Mat plt(1.1*size, 1.1*size, CV_8UC3);
    cv::line(plt, cv::Point2d(0, size), cv::Point2d(1.1*size, size), cv::Scalar(255, 255, 255));
    cv::line(plt, cv::Point2d(size*0.1, 0), cv::Point2d(size*0.1, size*1.1), cv::Scalar(255, 255, 255));
    for(int i=0;i<size;i++)
    {
        cv::circle(plt, cv::Point2d(0.1*size+i, size-(0.7/max)*size*signature.at(i)), 3, cv::Scalar(0, 0, 255), CV_FILLED);
    }
    cv::namedWindow(str, CV_WINDOW_AUTOSIZE);
    cv::moveWindow(str, 1.5*size, 0);
    cv::imshow(str, plt);
    cv::waitKey(0);
    cv::destroyAllWindows();
}