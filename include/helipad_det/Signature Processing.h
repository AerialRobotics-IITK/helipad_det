#include <ros/ros.h>
#include <opencv2/opencv.hpp>
#include <math.h>
#include <iostream>

void graph(const std::vector<double>&, cv::String);

double cross_product( cv::Point point,cv::Point line_start, cv::Point line_end){
   return fabs((point.x - line_start.x) * (line_end.y - line_start.y) - (point.y - line_start.y) * (line_end.x - line_start.x)) ;   
}

double baseLength(cv::Point line_end,cv::Point line_start){
    return cv::norm(line_end - line_start);
}

void pointToLineDistance(const std::vector<cv::Point>& contour, std::vector<double>& distances){
    int n = round(contour.size()/(26*3));
    for(int i=0; i< contour.size();i++){
        if(i-n>=0 && i+n<contour.size())
            distances.push_back(cross_product(contour[i],contour[i-n],contour[i+n])/baseLength(contour[i+n],contour[i-n]));
        else if(i-n<0 && i+n<contour.size())
            distances.push_back(cross_product(contour[i],contour[i-n + contour.size()],contour[i+n])/baseLength(contour[i+n],contour[i-n + contour.size()]));
        else if(i-n>=0 && i+n>=contour.size())
            distances.push_back(cross_product(contour[i],contour[i-n],contour[i+n-contour.size()])/baseLength(contour[i+n-contour.size()],contour[i-n]));
    }
    return;
}

void smooth(const std::vector<double>& input, std::vector<double>& output){
    ROS_ASSERT(input.size()==output.size());
    int i, size=input.size();
    
    for(i=0;i<output.size();i++)
        output[i]=0;

    if(input[0]>input[1] && input[0]>input[input.size()-1])
        output[0]=input[0];

    if(input[input.size()-1]>input[input.size()-2] && input[input.size()-1]> input[0])
        output[input.size()-1]=input[input.size()-1];

    for(i=1;i<input.size()-1;i++)
    {
        if(input[i]>=input[i+1] && input[i]>=input[i-1])
            output[i]=input[i];
        else
            output[i]=0;
    }
    
    int n=round(input.size()/(26*3));
    int x0=0, y0=0;
    for(i = 0;i<n;i++)
    {
        if(output.at(i)==0)
            continue;
        else
        {
            x0 = 0;
            y0 = 0;
            for(int j=size-n+i;j<size;j++)//Handling cases at the end of the vector
            {
                if(output.at(j)==0)
                    continue;
                else
                {
                    if(output.at(j)>y0)
                    {
                        x0=j;
                        y0=output.at(j);
                    }
                    output.at(j)=0;
                }
            }
            for(int j=0;j<=n+i;j++)//Handling cases at the start of the vector
            {
                if(output.at(j)==0)
                    continue;
                else
                {
                    if(output.at(j)>y0)
                    {
                        x0=j;
                        y0=output.at(j);
                    }
                    output.at(j)=0;
                }
            }
            output.at(x0)=y0;
        }
    }

    for(i = n;i<output.size()-n;i++)
    {
        if(output.at(i)==0)
            continue;
        else
        {
            x0 = 0;
            y0 = 0;
            for(int j=i-n;j<=i+n;j++)
            {
                if(output.at(j)==0)
                    continue;
                else
                {
                    if(output.at(j)>y0)
                    {
                        x0=j;
                        y0=output.at(j);
                    }
                    output.at(j)=0;
                }
            }
            output.at(x0)=y0;
        }
    }

    for(i = size-n;i<size;i++)
    {
        if(output.at(i)==0)
            continue;
        else
        {
            x0 = 0;
            y0 = 0;
            for(int j=i-n;j<size;j++)//Handling cases at the end of the vector
            {
                if(output.at(j)==0)
                    continue;
                else
                {
                    if(output.at(j)>y0)
                    {
                        x0=j;
                        y0=output.at(j);
                    }
                    output.at(j)=0;
                }
            }
            for(int j=0;j<=n+i-size;j++)//Handling cases at the start of the vector
            {
                if(output.at(j)==0)
                    continue;
                else
                {
                    if(output.at(j)>y0)
                    {
                        x0=j;
                        y0=output.at(j);
                    }
                    output.at(j)=0;
                }
            }
            output.at(x0)=y0;
        }
    }
    
    double mean=0, sd, mean_sq=0, count=0;
    for(i=0;i<output.size();i++)
    {
        if (output.at(i)!=0)
        {
            mean += output.at(i);
            mean_sq += output.at(i)*output.at(i);
            count++;
        }
    }
    mean_sq = mean_sq/count;
    mean = mean/count;
    sd = sqrt(mean_sq - mean*mean);
    for(i=0;i<output.size();i++)
        if(output.at(i)<mean-2*sd)
            output.at(i)=0;

    // for(i = 0;i<n;i++)
    // {
    //     if(output.at(i)==0)
    //         continue;
    //     else
    //     {
    //         x0 = 0;
    //         y0 = 0;
    //         count = 0;
    //         for(int j=output.size()-n;j<output.size();j++)
    //         {
    //             if(output.at(j)==0)
    //                 continue;
    //             else
    //             {
    //                 count++;
    //                     x0 += j-output.size();
    //                 if(output.at(j)>y0)
    //                     y0=output.at(j);
    //                 output.at(j)=0;
    //             }
    //         }
    //         for(int j=0;j<=i+n;j++)
    //         {
    //             if(output.at(j)==0)
    //                 continue;
    //             else
    //             {
    //                 count++;
    //                     x0 += j;
    //                 if(output.at(j)>y0)
    //                     y0=output.at(j);
    //                 output.at(j)=0;
    //             }
    //         }
    //         output.at(round(x0/count))=y0;
    //     }
    // }
}

void smoother(const std::vector<double>& input, std::vector<double>& output){
    ROS_ASSERT(input.size()==output.size());
    int i, step=round(input.size()/(26*6));
    for(i=0;i<output.size();i++)
        output[i]=0;
    std::vector<double> Derivative;
    Derivative.push_back((input.at(1)-input.at(input.size()-1))/2);
    for(i=1;i<input.size()-1;i++)
        Derivative.push_back((input.at(i+1)-input.at(i-1))/2);
    Derivative.push_back(input.at(0)-input.at(input.at(input.size()-2)));
    graph(Derivative , "Derivative");

    for (i=0;i<Derivative.size();i++)
    {
        if(Derivative.at(i)!=0)
            output.push_back(0);
        else
        {
            int flag=1;
            for(int j=i-step;j<i;j++)
            {
                if(fabs(Derivative.at(j))==0)
                {
                    output.push_back(0);
                    flag = 0;
                    break;
                }
            }

            if (flag){
                for(int j=i+1;j<=i+step;j++)
                {
                    if (fabs(Derivative.at(j)==0.1))
                        output.push_back(0);
                        flag=0;
                        break;
                }
            }
            else
                continue;
            if (!flag)
                output.push_back(0);
            else
                output.push_back(1);
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

void graph(const std::vector<double>& signature, cv::String str){
    int size = signature.size(), max=0;
    for(int i=0;i<size;i++)
        if(signature.at(i)>max)max=signature.at(i);
    cv::Mat plt = cv::Mat::zeros(ceil(1.1*size), ceil(1.1*size), CV_8UC3);
    cv::line(plt, cv::Point2d(0, size), cv::Point2d(1.1*size, size), cv::Scalar(255, 255, 255));
    cv::line(plt, cv::Point2d(size*0.1, 0), cv::Point2d(size*0.1, size*1.1), cv::Scalar(255, 255, 255));
    for(int i=0;i<size;i++)
    {
        cv::circle(plt, cv::Point2d(0.1*size+i, size-(0.7/max)*size*signature.at(i)), 3, cv::Scalar(0, 0, 255), CV_FILLED);
        if((size-(0.7/max)*size*signature.at(i))>0)
            cv::line(plt, cv::Point2d(0.1*size-0.01*size, (size-(0.7/max)*size*i)), cv::Point2d(0.1*size+0.01*size, (size-(0.7/max)*size*i)), cv::Scalar(255, 0, 0));
    }
    cv::namedWindow(str, CV_WINDOW_FREERATIO);
    // cv::moveWindow(str, size, 0);
    cv::imshow(str, plt);
    cv::waitKey(0);
    cv::destroyAllWindows();
}

void Retrace(const std::vector<double>& Signature, const std::vector<cv::Point>& Contour, cv::Mat img){
    for(int i=0;i<Signature.size();i++)
        if(Signature.at(i)!=0)
            cv::circle(img, Contour.at(i), 5, cv::Scalar(0, 0, 255));
}

void centre(const std::vector<double>& Signature, const std::vector<cv::Point> Contour, cv::Mat img){
    int x0=0, y0=0, count=0;
    for(int i=0;i<Signature.size();i++)
    {
        if(Signature.at(i)!=0)
        {
            count++;
            x0 += Contour.at(i).x;
            y0 += Contour.at(i).y;
        }
    }
    x0 = round( (double)x0/count);
    y0 = round( (double)y0/count);
    cv::circle(img, cv::Point(x0, y0), 3, cv::Scalar(255, 0, 0), -1);
}