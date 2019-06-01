#include <opencv2/opencv.hpp>
#include <math.h>
#include <iostream>

double cross_product( cv::Point point,cv::Point line_start, cv::Point line_end){

   return fabs((point.x - line_start.x) * (line_end.y - line_start.y) - (point.y - line_start.y) * (line_end.x - line_start.x)) ;
}

double baseLength(cv::Point line_end,cv::Point line_start){
    return cv::norm(line_end - line_start);
}

void pointToLineDistance(std::vector<cv::Point>& contour, std::vector<double>& distances, int n){
    for(unsigned int i=0; i< contour.size();i++){
        if(i-n>=0 && i+n<contour.size())
            distances.push_back(cross_product(contour[i],contour[i-n],contour[i+n])/baseLength(contour[i+n],contour[i-n]));
        else if(i-n<0 && i+n<contour.size())
            distances.push_back(cross_product(contour[i],contour[i-n + contour.size()-1],contour[i+n])/baseLength(contour[i+n],contour[i-n + contour.size()-1]));
        else if(i-n>0 && i+n>=contour.size())
            distances.push_back(cross_product(contour[i],contour[i-n],contour[i+n-contour.size()+1])/baseLength(contour[i+n-contour.size()+1],contour[i-n]));
    }
    return;
}