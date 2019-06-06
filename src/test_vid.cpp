#include <ros/ros.h>
#include <helipad_det/Preprocess.h>
#include <helipad_det/Signature Processing.h>
#include <helipad_det/Signature Matching.h>
#include <opencv2/opencv.hpp>

int main(int argc, char** argv)
{
    ros::init(argc, argv, "test1");
    ros::NodeHandle nh;
    int canny_lowThres, ratio, kernel_size, i, count=0;
    nh.getParam("/helipad_det/low_threshold", canny_lowThres);
    nh.getParam("/helipad_det/ratio", ratio);
    nh.getParam("/helipad_det/kernel_size", kernel_size);
    cv::Mat frame, processed_frame;
    std::vector<std::vector<cv::Point> > ListContours;
    std::vector<double> Distances;
    std::vector<double> Signature;
    cv::VideoCapture cap;
    cap.open(1);
    
    while (ros::ok())
    {
        cap >> frame;
        // frame=cv::imread("etc/Refined H.png");
        ROS_ASSERT(frame.empty()!=true);
        processed_frame = Preprocess(frame, canny_lowThres, ratio, kernel_size);
        cv::imshow("Canny", processed_frame);
        cv::findContours(processed_frame, ListContours, CV_RETR_LIST, CV_CHAIN_APPROX_NONE);

        for(i=0;i<ListContours.size();i++)
        {
            if(cv::contourArea(ListContours.at(i)) < 0.01*frame.size().area())
                continue;
            Distances.clear();
            Signature.clear();
            pointToLineDistance(ListContours.at(i), Distances);
            for(int j=0;j<Distances.size();j++)
                Signature.push_back(0);            
            smooth(Distances, Signature);
            if(isSimilar(Signature)==1)
            {
                count++;
                std::cout << "CHAAP-ED" << count << std::endl;
                cv::drawContours(frame, ListContours, i, cv::Scalar(255, 0, 255));
                centre(Signature, ListContours.at(i), frame);
                break;
            }
        }

        cv::imshow("Detected H", frame);
        cv::waitKey(30);
        ros::spinOnce();
    }
    return 0;
}
