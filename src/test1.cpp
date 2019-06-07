#include <ros/ros.h>
#include <helipad_det/Preprocess.h>
#include <helipad_det/Signature Processing.h>
#include <helipad_det/Signature Matching.h>
#include <opencv2/opencv.hpp>

int main(int argc, char** argv)
{
    ros::init(argc, argv, "test1");
    ros::NodeHandle param_get("~");
    int canny_lowThres, ratio, kernel_size, i;
    param_get.param("low_threshold", canny_lowThres, 50);
    param_get.param("ratio", ratio, 3);
    param_get.param("kernel_size", kernel_size, 3);
    cv::Mat img = cv::imread("/home/tanay/catkin_ws/src/helipad_det/etc/Refined H.png");
    cv::Size size = img.size();
    int type = img.type();
    ROS_ASSERT(img.empty()!=true);
    // cv::imshow("img", img);
    cv::Mat prepro_img = Preprocess(img, canny_lowThres, ratio, kernel_size);
    cv::imshow("Preprocessed Image", prepro_img);
    cv::waitKey(0);
    cv::destroyAllWindows();
    std::vector<std::vector<cv::Point> > ListContours;

    cv::findContours(prepro_img, ListContours, CV_RETR_TREE, CV_CHAIN_APPROX_NONE);
	std::vector<std::vector<double> > ListDistance(ListContours.size());
    for(i=0;i<ListContours.size();i++)
    {
        if(cv::contourArea(ListContours.at(i)) < 0.01*img.size().area())
            continue;
        cv::Mat img_tmp = cv::Mat::zeros(size, type);
        pointToLineDistance(ListContours.at(i), ListDistance.at(i));
        std::vector<double> temp(ListDistance.at(i).size());
        std::cout << ListContours.at(i).size() << std::endl ;
        smooth(ListDistance.at(i), temp);
        graph(ListDistance.at(i), "Unrefined Graph");
        graph(temp, "Refined Graph");
        if(isSimilar(temp)==1)
        {
            std::cout << "CHAAP-ED" << std::endl;
            centre(temp, ListContours.at(i), img_tmp);
        }
        cv::drawContours(img_tmp, ListContours, i, cv::Scalar(255, 0, 255));
        Retrace(temp, ListContours.at(i), img_tmp);
        cv::imshow("contours", img_tmp);

        if((char)cv::waitKey(0)=='q')
            return -1;
        cv::destroyAllWindows();
        ros::spinOnce();
        // for(int j=0;j<temp.size();j++)
        //     std::cout << temp.at(j) << std::endl;
        // std::cout << std::endl << std::endl;
    }
    std::cout << size.area() << std::endl ;
    return 0;
}
