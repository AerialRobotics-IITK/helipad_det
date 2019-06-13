#ifndef HELIPAD_DET_POSE_ESTIMATION_H
#define HELIPAD_DET_POSE_ESTIMATION_H

geometry_msgs::Point findPose(cv::Point centre,ros::NodeHandle nh,nav_msgs::Odometry odom)
{
    while (odom.pose.pose.position.z == 0) ros::spinOnce();
    cv::Mat intrinsic = cv::Mat_<double>(3, 3);

    Eigen::Matrix3f camMatrix, invCamMatrix, camToQuad, quadToCam;
    Eigen::Vector3f tCam;

    std::vector<double> tempList;
    int tempIdx = 0;

    nh.getParam("hdetect/camera_matrix/data", tempList);
    tempIdx = 0;
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            intrinsic.at<double>(i, j) = tempList[tempIdx++];
        }
    }

    nh.getParam("hdetect/camera/translation", tempList);
    for (int i = 0; i < 3; i++)
    {
        tCam(i) = tempList[i];
    }
    
    nh.getParam("hdetect/camera/rotation", tempList);
    tempIdx = 0;
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            quadToCam(i, j) = tempList[tempIdx++];
        }
    }

    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            camMatrix(i, j) = intrinsic.at<double>(i, j);
        }
    }

    invCamMatrix = camMatrix.inverse();
    camToQuad = quadToCam.inverse();

    geometry_msgs::Point temp;

    Eigen::Matrix3f scaleUp, quadToGlob;

    tf::Quaternion q1(odom.pose.pose.orientation.x, odom.pose.pose.orientation.y, odom.pose.pose.orientation.z, odom.pose.pose.orientation.w);
    Eigen::Quaternionf quat = Eigen::Quaternionf(q1.w(), q1.x(), q1.y(), q1.z());
    quadToGlob = quat.toRotationMatrix();

    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            if (i == j)
                scaleUp(i, j) = odom.pose.pose.position.z;
            else
                scaleUp(i, j) = 0;
        }
    }

    Eigen::Vector3f imgVec(centre.x, centre.y, 1);
    Eigen::Vector3f quadCoord = camToQuad * scaleUp * invCamMatrix * imgVec;

    quadCoord = quadCoord + tCam;
    std::cout << quadCoord << std::endl << std::endl;

    Eigen::Vector3f globCoord = quadToGlob * quadCoord;
    temp.x = globCoord(0) + odom.pose.pose.position.x;
    temp.y = globCoord(1) + odom.pose.pose.position.y;
    temp.z = globCoord(2) + odom.pose.pose.position.z;

    return temp;
}

#endif