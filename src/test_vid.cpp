#include <ros/ros.h>
#include <helipad_det/preprocess.h>
#include <helipad_det/signature_processing.h>
#include <helipad_det/signature_matching.h>
#include <opencv2/opencv.hpp>

int main(int argc, char** argv)
{
    ros::init(argc, argv, "test_vid");  
    ros::NodeHandle nh;

    double a,b,c,d,signature_tolerance, area_tolerance;
    int canny_lowThres, ratio, kernel_size, i, count=0;
    
    nh.param("low_threshold", canny_lowThres, 100);
    nh.param("ratio", ratio), 3;
    nh.param("kernel_size", kernel_size, 3);
    
    nh.param("a", a, 0.19);
    nh.param("b", b, 0.04);
    nh.param("c", c, 0.08);
    nh.param("d", d, 0.08);
    nh.param("signature_tolerance", signature_tolerance, 0.05);
    nh.param("area_tolerance", area_tolerance, 0.05);


    cv::Mat frame, processed_frame;
    std::vector<std::vector<cv::Point> > ListContours;
    std::vector<double> Distances;
    std::vector<double> Signature;
    
    cv::VideoCapture cap;
    cap.open(0);
    
    while (ros::ok())
    {
        cap >> frame;
        ROS_ASSERT(frame.empty()!=true);

        processed_frame = preprocess(frame, canny_lowThres, ratio, kernel_size,is_undistort);
        cv::imshow("Preprocessed Frame", processed_frame);
        
        cv::findContours(processed_frame, ListContours, CV_RETR_LIST, CV_CHAIN_APPROX_NONE);

        for(i=0;i<ListContours.size();i++)
        {
            if(cv::contourArea(ListContours.at(i)) < area_tolerance*frame.size().area())
                continue;

            Distances.clear();
            Signature.clear();

            pointToLineDistance(ListContours.at(i), Distances, b);          
            smooth(Distances, Signature);

            if(isSimilar(Signature, a, b, c, d, signature_tolerance))
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
    }
    return 0;
}