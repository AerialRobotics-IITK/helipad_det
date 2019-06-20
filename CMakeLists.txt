cmake_minimum_required(VERSION 2.8.3)
project(helipad_det)

find_package(catkin REQUIRED)
find_package(catkin_simple REQUIRED)
catkin_simple()

add_definitions(-std=c++11)
set(CMAKE_BUILD_TYPE Release)

find_package(Eigen REQUIRED)
include_directories(${Eigen_INCLUDE_DIRS})

find_package(OpenCV 3 REQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS})

#cs_add_executable(test_vid src/test_vid.cpp)
#target_link_libraries(test_vid ${catkin_LIBRARIES} ${OpenCV_LIBRARIES})

cs_add_executable(test1 src/test1.cpp)
target_link_libraries(test1 ${catkin_LIBRARIES} ${OpenCV_LIBRARIES})

cs_add_executable(hdetect src/hdetect.cpp)
target_link_libraries(hdetect ${catkin_LIBRARIES} ${OpenCV_LIBRARIES})
