cmake_minimum_required(VERSION 2.8.3)
project(helipad_det)

find_package(OpenCV REQUIRED)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  sensor_msgs
  cv_bridge
  image_transport
  geometry_msgs
  tf
)

catkin_package(
  INCLUDE_DIRS include
)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
  ${OpenCV_INCLUDE_DIRS}
)

add_executable(hdetect src/hdetect.cpp)
target_link_libraries(hdetect ${catkin_LIBRARIES} ${OpenCV_LIBRARIES})

add_executable(test1 src/test1.cpp)
target_link_libraries(test1 ${catkin_LIBRARIES} ${OpenCV_LIBRARIES})

add_executable(test_vid src/test_vid.cpp)
target_link_libraries(test_vid ${catkin_LIBRARIES} ${OpenCV_LIBRARIES})
