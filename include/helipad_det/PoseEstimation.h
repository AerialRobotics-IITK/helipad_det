#include <geometry_msgs/PoseStamped.h>
#include <nav_msgs/Odometry.h>
#include <Eigen/Dense>
#include <Eigen/Core>
#include <tf/Quaternion.h>
#include <geometry_msgs/Point>

geometry_msgs::Point findPose(cv::Point centre,ros::NodeHandle nh)
{
    geometry_msgs::Point temp;
    Eigen::Matrix4f camMatrix, quadToCam, globToQuad;
    Eigen::Matrix4f invCamMatrix, camToQuad, quadToGlob, scaleUp;

    tf::Quaternion q1(odom.pose.pose.orientation.x, odom.pose.pose.orientation.y, odom.pose.pose.orientation.z, odom.pose.pose.orientation.w);
    Eigen::Quaternionf quat = Eigen::Quaternionf(q1.w(), q1.x(), q1.y(), q1.z());
    Eigen::Matrix3f rotQuadtoCam = quat.toRotationMatrix();

    float tCamX = 0, tCamY = 0, tCamZ = 0;
    nh.getParam("/detector/camera/translation/x", tCamX);//add param
    nh.getParam("/detector/camera/translation/y", tCamY);
    nh.getParam("/detector/camera/translation/z", tCamZ);

    for(int i=0; i<4; i++)
    {
        for(int j=0; j<4; j++)
        {
            if(i==3) 
            {
                if(j==3) camMatrix(i,j) = quadToCam(i, j) = globToQuad(i, j) = scaleUp(i, j) = 1;
                else camMatrix(i, j) = quadToCam(i, j) = globToQuad(i, j) = scaleUp(i,j) = 0;
            }
            else if(j==3)
            {
                camMatrix(i, j) = scaleUp(i, j) = 0;
                switch(i)
                {
                    case 0: quadToCam(i, j) = tCamX; globToQuad(i, j) = -odom.pose.pose.position.x; break;
                    case 1: quadToCam(i, j) = tCamY; globToQuad(i, j) = -odom.pose.pose.position.y; break;
                    case 2: quadToCam(i, j) = tCamZ; globToQuad(i, j) = -odom.pose.pose.position.z; break;
                }
            }
            else
            {
                camMatrix(i, j) = intrinsic.at<double>(i,j);
                globToQuad(i, j) = rotQuadtoCam(i, j);
                quadToCam(i, j) = ((i+j)%3 == 1) ? -1 : 0;
                scaleUp(i, j) = (i==j) ? odom.pose.pose.position.z : 0;
            }
        }
    }

    invCamMatrix = camMatrix.inverse();
    camToQuad = quadToCam.inverse();
    quadToGlob = globToQuad.inverse();

   
    
    Eigen::Vector4f imgVec(centre.x,centre.y,1,1);
    Eigen::Vector4f globCoord = quadToGlob*camToQuad*scaleUp*invCamMatrix*imgVec;

    temp.position.x = globCoord(0); 
    temp.position.y = globCoord(1);
    temp.position.z = globCoord(2);

    

    return temp;
}