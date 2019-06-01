#include <math.h>

void smooth(int* d, int size){
    int i;
    int temp[size]={};
    if(d[0]>d[1])
        temp[0]=d[0];
    if(d[size-1]>d[size-2])
        temp[size-1]=d[size-1];
    if(temp[0]!=0 && temp[size-1]!=0)
    {
        if(temp[0]>temp[size-1])
            temp[size-1]=0;
        else
            temp[0]=0;    
    }
    for(i=1;i<size-1;i++)
    {
        if(d[i]>d[i+1] && d[i]>d[i-1])
            temp[i]=d[i];
        else
            temp[i]=0;
    }
    for(i=0;i<size;i++)
        d[i]=temp[i];
}

void normalize(int* d, int n, int size){
    int i;
    int temp[size];
    for(i=0;i<size;i++)
        temp[i]=asin((2*d[i]*sqrt(n*n-d[i]*d[i]))/(n*n));
    for(i=0;i<size;i++)
        d[i]=temp[i];
}