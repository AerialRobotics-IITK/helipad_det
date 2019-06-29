# helipad_det
The aim of this ROS package is to provide detection and pose estimation of an H-shaped helipad for the purpose of landing a UAV. The approach is based on [this](https://link.springer.com/article/10.1007/s10846-018-0933-2) paper. It provides robust and accurate detection of the helipad from different angles and orientations.
## Dependencies
This package has the following dependencies:
- [OpenCV](https://opencv.org/) (3.0 or higher)
- [Eigen](http://eigen.tuxfamily.org/index.php?title=Main_Page)
- [img_proc](https://github.com/tanaysaha/img_proc)
- ROS Kinetic (stable, tested) with the following packages:

  - catkin
  - [catkin_simple](https://github.com/catkin/catkin_simple)
  - roscpp
  - [usb_cam](https://github.com/ros-drivers/usb_cam.git) (for obtaining images from a camera connected via USB)
  - [cmake_modules](https://github.com/ros/cmake_modules)
  - message_generation (for creating and using custom messages)
  - std_msgs
  - sensor_msgs
  - nav_msgs
  - geometry_msgs
  - [eigen_conversions](https://github.com/ros/geometry) (Eigen compatibility with ROS)
  - [cv_bridge](https://github.com/ros-perception/vision_opencv) (OpenCV compatibility with ROS)
  - image_transport
  - [tf](https://github.com/ros/geometry)
## Installation
Create a catkin workspace(ignore this if you have already done this)
```shell
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws
catkin config -DCMAKE_BUILD_TYPE=Release
catkin init
```

Clone the repository into the source folder.
```shell
cd ~/catkin_ws/src
git clone https://github.com/amartyadash/helipad_det.git
```
Build using either (preferably) `catkin build helipad_det` or `catkin_make` after ensuring all dependencies are met.  
## Nodes
-hdetect : Detects the 'H' marker and calculates its location in ground truth
## Topics
Topics can be remapped to suit your use case using the `remap` tags in the `hdetect.launch` file.
### hdetect node
+ Subscribed
    
