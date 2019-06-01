#include <opencv2/opencv.hpp>
#include <math.h>
#include <iostream>

void smooth(std::vector<double>& input, std::vector<double>& output){
    int i;
    if(input[0]>input[1])
        output[0]=input[0];
    if(input[input.size()-1]>input[input.size()-2])
        output[input.size()-1]=input[input.size()-1];
    if(output[0]!=0 && output[input.size()-1]!=0)
    {
        if(output[0]>output[input.size()-1])
            output[input.size()-1]=0;
        else
            output[0]=0;    
    }
    for(i=1;i<input.size()-1;i++)
    {
        if(input[i]>input[i+1] && input[i]>input[i-1])
            output[i]=input[i];
        else
            output[i]=0;
    }
}

void normalize(std::vector<double>& input, std::vector<double>& output, int n){
    int i;
    for(i=0;i<input.size();i++)
    {
        if(input[i]==0)
            output[i]=3.1416;
        else
            output[i]=asin((2*input[i]*sqrt(n*n-input[i]*input[i]))/(n*n));
    }
}