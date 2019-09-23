#include <helipad_det/preprocess.h>
#include <helipad_det/signature_processing.h>
#include <helipad_det/signature_matching.h>

int main(int argc, char** argv)
{
    ros::init(argc, argv, "test1");
    ros::NodeHandle param_get("~");

    double a,b,c,d,signature_tolerance, area_tolerance;
    int canny_lowThres, ratio, kernel_size, i;
    bool is_undistort;
    std::vector<double> cam_mat;
    std::vector<double> dist_coeff;

    // param_get.param("low_threshold", canny_lowThres, 80);
    // param_get.param("ratio", ratio, 3);
    // param_get.param("kernel_size", kernel_size, 3);
    // param_get.param("a", a, 0.19);
    // param_get.param("b", b, 0.04);
    // param_get.param("c", c, 0.08);
    // param_get.param("d", d, 0.08);
    // param_get.param("signature_tolerance", signature_tolerance, 0.05);
    // param_get.param("area_tolerance", area_tolerance, 0.05);
    // param_get.getParam("distortion_coefficients/data", dist_coeff);
    // param_get.getParam("camera_matrix/data", cam_mat);

    cv::Mat img = cv::imread("/home/tanay/catkin_ws/src/helipad_det/etc/helipad_final.jpg");
    ROS_ASSERT(img.empty()!=true);

    cv::Mat prepro_img = preprocess(img, 20, cam_mat, dist_coeff, is_undistort);
    cv::imshow("Preprocessed Image", prepro_img);
    cv::waitKey(0);
    cv::destroyAllWindows();

    std::vector<std::vector<cv::Point> > ListContours;
    std::vector<cv::Vec3d> ListCircles;

    // cv::HoughCircles(prepro_img, ListCircles, CV_HOUGH_GRADIENT, 1, 0.00001);

    cv::findContours(prepro_img, ListContours, CV_RETR_TREE, CV_CHAIN_APPROX_NONE);
    std::vector<std::vector<cv::Point> > approxCurve(ListContours.size());
    cv::cvtColor(prepro_img, prepro_img, CV_GRAY2BGR);
    std::vector<double> Distances;
    std::vector<double> Signature;

    std::cout << ListCircles.size() << std::endl;

    for(i=0;i<ListContours.size();i++)
    {
        // cv::drawContours(img, ListContours, i, cv::Scalar(255,0,0));
        cv::approxPolyDP(ListContours.at(i), approxCurve.at(i), 0.001*ListContours.at(i).size(), true);
        if(approxCurve.at(i).size()>20)
        {
            std::cout << approxCurve.at(i).size() << std::endl;
            cv::drawContours(img, ListContours, i, cv::Scalar(0, 0, 255));
            cv::imshow("intermidiate", img);
            cv::waitKey(0);
        }
        // if(cv::contourArea(ListContours.at(i)) < area_tolerance*img.size().area())
        //     continue;
        // Distances.clear();
        // Signature.clear();

        // pointToLineDistance(ListContours.at(i), Distances, b);
        // smooth(Distances, Signature, b);

        // graph(Distances, "Unrefined Graph");
        // graph(Signature, "Refined Graph");

        // if(isSimilar(Signature, ListContours.at(i), a, b, c, d, signature_tolerance))
        //     centre(Signature, ListContours.at(i), prepro_img);
        // cv::drawContours(prepro_img, ListContours, i, cv::Scalar(255, 0, 255));
        // retrace(Signature, ListContours.at(i), prepro_img);
        // cv::imshow("contours", prepro_img);

        // if((char)cv::waitKey(0)=='q')
        //     return -1;
        // cv::destroyAllWindows();
    }

    cv::imshow("final", img);
    cv::waitKey(0);
    std::cout << img.size().area() << std::endl ;

    return 0;
}
