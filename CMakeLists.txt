cmake_minimum_required(VERSION 2.8.3)
project(heli_det)

find_package(catkin_simple REQUIRED)

catkin_simple(ALL_DEPS_REQUIRED)

#add_definitions(-std=c++11)

#############
# LIBRARIES #
#############
cs_add_library(${PROJECT_NAME}
  src/detect.cpp
)

############
# BINARIES #
############
cs_add_executable(detect
  src/detect.cpp
)
target_link_libraries(detect ${PROJECT_NAME})

##########
# EXPORT #
##########
cs_install()

cs_export()
