#ifndef HELIPAD_DET_SIGNATURE_PROCESSING_H
#define HELIPAD_DET_SIGNATURE_PROCESSING_H

double crossProduct(cv::Point point, cv::Point line_start, cv::Point line_end){
   return fabs((point.x - line_start.x) * (line_end.y - line_start.y) - (point.y - line_start.y) * (line_end.x - line_start.x)) ;   
}

double baseLength(cv::Point line_end, cv::Point line_start){
    return cv::norm(line_end - line_start);
}

void pointToLineDistance(const std::vector<cv::Point>& contour, std::vector<double>& distances, double n){
    for(int i=0; i< contour.size();i++){
        if(i-n>=0 && i+n<contour.size())
            distances.push_back(crossProduct(contour.at(i),contour.at(i-n),contour.at(i+n))/baseLength(contour.at(i+n),contour.at(i-n)));
        else if(i-n<0 && i+n<contour.size())
            distances.push_back(crossProduct(contour.at(i),contour.at(i-n + contour.size()),contour.at(i+n))/baseLength(contour.at(i+n),contour.at(i-n + contour.size())));
        else if(i-n>=0 && i+n>=contour.size())
            distances.push_back(crossProduct(contour.at(i),contour.at(i-n),contour.at(i+n-contour.size()))/baseLength(contour.at(i+n-contour.size()),contour.at(i-n)));
    }
}

void smooth(const std::vector<double>& distances, std::vector<double>& signature, double n){
    int i, size=distances.size();
    // double time = (double) cv::getTickCount();
    for(i=0;i<size;i++)
        signature.push_back(0);

    if(distances.at(0)>=distances.at(1) && distances.at(0)>=distances.at(size-1) && distances.at(0)>=0.002*size)
        signature.at(0)=distances.at(0);

    if(distances.at(size-1)>=distances.at(size-2) && distances.at(size-1)>=distances.at(0) && distances.at(size-1)>=0.002*size)
        signature.at(size-1)=distances.at(size-1);

    for(i=1;i<size-1;i++)
    {
        if(distances.at(i)>=distances.at(i+1) && distances.at(i)>=distances.at(i-1) && distances.at(i)>=0.002*size)
            signature.at(i)=distances.at(i);
        else
            signature.at(i)=0;
    }
    
    int x0=0, y0=0;

    for(i = 0;i<n;i++)
    {
        if(signature.at(i)==0)
            continue;
        else
        {
            x0 = 0;
            y0 = 0;
            for(int j=size-n+i;j<size;j++)//Handling cases at the end of the vector
            {
                if(signature.at(j)==0)
                    continue;
                else
                {
                    if(signature.at(j)>y0)
                    {
                        x0=j;
                        y0=signature.at(j);
                    }
                    signature.at(j)=0;
                }
            }
            for(int j=0;j<=n+i;j++)//Handling cases at the start of the vector
            {
                if(signature.at(j)==0)
                    continue;
                else
                {
                    if(signature.at(j)>y0)
                    {
                        x0=j;
                        y0=signature.at(j);
                    }
                    signature.at(j)=0;
                }
            }
            signature.at(x0)=y0;
        }
    }

    for(i = n;i<size-n;i++)
    {
        if(signature.at(i)==0)
            continue;
        else
        {
            x0 = 0;
            y0 = 0;
            for(int j=i-n;j<=i+n;j++)
            {
                if(signature.at(j)==0)
                    continue;
                else
                {
                    if(signature.at(j)>y0)
                    {
                        x0=j;
                        y0=signature.at(j);
                    }
                    signature.at(j)=0;
                }
            }
            signature.at(x0)=y0;
        }
    }

    for(i = size-n;i<size;i++)
    {
        if(signature.at(i)==0)
            continue;
        else
        {
            x0 = 0;
            y0 = 0;
            for(int j=i-n;j<size;j++)//Handling cases at the end of the vector
            {
                if(signature.at(j)==0)
                    continue;
                else
                {
                    if(signature.at(j)>y0)
                    {
                        x0=j;
                        y0=signature.at(j);
                    }
                    signature.at(j)=0;
                }
            }
            for(int j=0;j<=n+i-size;j++)//Handling cases at the start of the vector
            {
                if(signature.at(j)==0)
                    continue;
                else
                {
                    if(signature.at(j)>y0)
                    {
                        x0=j;
                        y0=signature.at(j);
                    }
                    signature.at(j)=0;
                }
            }
            signature.at(x0)=y0;
        }
    }
    // std::cout << "TIME TAKEN=" << ((double)cv::getTickCount()-time)/cv::getTickFrequency() << std::endl;
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
    cv::imshow(str, plt);
    cv::waitKey(0);
    cv::destroyAllWindows();
}

void retrace(const std::vector<double>& Signature, const std::vector<cv::Point>& Contour, cv::Mat& img){
    for(int i=0;i<Signature.size();i++)
        if(Signature.at(i)!=0)
            cv::circle(img, Contour.at(i), 5, cv::Scalar(0, 0, 255));
}

cv::Point centre(const std::vector<double>& Signature, const std::vector<cv::Point>& Contour, cv::Mat& img){
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
    return cv::Point(x0, y0);
}

int loc(int i, int n)
{
    if(0<=i<n)
        return i;
    else if(i>=n)
    {
        return i%n;
    }
    else if(i<0)
    {
        return n+i;
    }   
}

#endif