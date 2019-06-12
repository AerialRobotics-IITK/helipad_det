#include <ros/ros.h>
#include <helipad_det/preprocess.h>
#include <helipad_det/signProc.h>
#include <helipad_det/signMatch.h>
#include <opencv2/opencv.hpp>

int main(int argc, char** argv)
{
    double a,b,c,d,tolerance;
    ros::init(argc, argv, "test1");
    ros::NodeHandle nh;
    int canny_lowThres, ratio, kernel_size, i, count=0;
    nh.param("low_threshold", canny_lowThres, 100);
    nh.param("ratio", ratio), 3;
    nh.param("kernel_size", kernel_size, 3);
    nh.param("a",a,0.19);
    nh.param("b",b,0.19);
    nh.param("c",c,0.19);
    nh.param("d",d,0.19);
    nh.param("tolerance",tolerance,0.19);
    cv::Mat frame, processed_frame;
    std::vector<std::vector<cv::Point> > ListContours;
    std::vector<double> Distances;
    std::vector<double> Signature;
    cv::VideoCapture cap;
    cap.open(1);
    
    while (ros::ok())
    {
        cap >> frame;
        // frame=cv::imread("/home/tanay/catkin_ws/src/helipad_det/etc/Refined H.jpg");
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
            if(isSimilar(Signature,a,b,c,d,tolerance)==1)
            {
                count++;
                std::cout << "CHAAP-ED" << count << std::endl;
                cv::drawContours(frame, ListContours, i, cv::Scalar(255, 0, 255));
                (centre(Signature, ListContours.at(i), frame));
                break;
            }
        }

        cv::imshow("Detected H", frame);
        cv::waitKey(30);
        ros::spinOnce();
    }
    return 0;
}