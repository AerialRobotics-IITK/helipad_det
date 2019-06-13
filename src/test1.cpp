#include <ros/ros.h>
#include <helipad_det/preprocess.h>
#include <helipad_det/signature_processing.h>
#include <helipad_det/signature_matching.h>
#include <opencv2/opencv.hpp>

int main(int argc, char** argv)
{
    ros::init(argc, argv, "test1");
    ros::NodeHandle param_get("~");

    double a,b,c,d,tolerance;
    int canny_lowThres, ratio, kernel_size, i;

    param_get.param("low_threshold", canny_lowThres, 80);
    param_get.param("ratio", ratio, 3);
    param_get.param("kernel_size", kernel_size, 3);
    param_get.param("a", a, 0.19);
    param_get.param("b", b, 0.04);
    param_get.param("c", c, 0.08);
    param_get.param("d", d, 0.08);
    param_get.param("tolerance", tolerance, 0.05);

    cv::Mat img = cv::imread("/home/tanay/catkin_ws/src/helipad_det/etc/Refined H2.jpg");
    ROS_ASSERT(img.empty()!=true);

    cv::Mat prepro_img = preprocess(img, canny_lowThres, ratio, kernel_size);
    cv::imshow("Preprocessed Image", prepro_img);
    cv::waitKey(0);
    cv::destroyAllWindows();

    std::vector<std::vector<cv::Point> > ListContours;

    cv::findContours(prepro_img, ListContours, CV_RETR_TREE, CV_CHAIN_APPROX_NONE);

    std::vector<double> Distances;
    std::vector<double> Signature;

    for(i=0;i<ListContours.size();i++)
    {
        if(cv::contourArea(ListContours.at(i)) < 0.01*img.size().area())
            continue;

        Distances.clear();
        Signature.clear();

        pointToLineDistance(ListContours.at(i), Distances);
        smooth(Distances, Signature);

        graph(Distances, "Unrefined Graph");
        graph(Signature, "Refined Graph");

        if(isSimilar(Signature, a, b, c, d, tolerance))
            centre(Signature, ListContours.at(i), img);
        cv::drawContours(img, ListContours, i, cv::Scalar(255, 0, 255));
        retrace(Signature, ListContours.at(i), img);
        cv::imshow("contours", img);

        if((char)cv::waitKey(0)=='q')
            return -1;
        cv::destroyAllWindows();
    }

    std::cout << img.size().area() << std::endl ;

    return 0;
}
