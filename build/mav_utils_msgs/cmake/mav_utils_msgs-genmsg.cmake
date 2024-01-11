# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "mav_utils_msgs: 8 messages, 1 services")

set(MSG_I_FLAGS "-Imav_utils_msgs:/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg;-Iroscpp:/opt/ros/noetic/share/roscpp/cmake/../msg;-Imav_msgs:/home/shubh/catkin_ws/src/mav_comm/mav_msgs/msg;-Inav_msgs:/opt/ros/noetic/share/nav_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Imavros_msgs:/opt/ros/noetic/share/mavros_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg;-Igeographic_msgs:/opt/ros/noetic/share/geographic_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Iuuid_msgs:/opt/ros/noetic/share/uuid_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(mav_utils_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPose.msg" NAME_WE)
add_custom_target(_mav_utils_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_utils_msgs" "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPose.msg" "geometry_msgs/Point"
)

get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPoses.msg" NAME_WE)
add_custom_target(_mav_utils_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_utils_msgs" "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPoses.msg" "geometry_msgs/Point:mav_utils_msgs/BBPose"
)

get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBox.msg" NAME_WE)
add_custom_target(_mav_utils_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_utils_msgs" "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBox.msg" ""
)

get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBoxes.msg" NAME_WE)
add_custom_target(_mav_utils_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_utils_msgs" "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBoxes.msg" "mav_utils_msgs/BBox"
)

get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterData.msg" NAME_WE)
add_custom_target(_mav_utils_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_utils_msgs" "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterData.msg" "geometry_msgs/Point"
)

get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterInfo.msg" NAME_WE)
add_custom_target(_mav_utils_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_utils_msgs" "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterInfo.msg" "geometry_msgs/Point:std_msgs/Header:mav_utils_msgs/RouterData"
)

get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/TaskInfo.msg" NAME_WE)
add_custom_target(_mav_utils_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_utils_msgs" "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/TaskInfo.msg" "geometry_msgs/Point:std_msgs/Header"
)

get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/UTMPose.msg" NAME_WE)
add_custom_target(_mav_utils_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_utils_msgs" "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/UTMPose.msg" "std_msgs/Header:geometry_msgs/Vector3:geometry_msgs/Point:geometry_msgs/Quaternion:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/srv/signal.srv" NAME_WE)
add_custom_target(_mav_utils_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_utils_msgs" "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/srv/signal.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_cpp(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPoses.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_cpp(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_cpp(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBoxes.msg"
  "${MSG_I_FLAGS}"
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBox.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_cpp(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_cpp(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterData.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_cpp(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/TaskInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_cpp(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/UTMPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_utils_msgs
)

### Generating Services
_generate_srv_cpp(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/srv/signal.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_utils_msgs
)

### Generating Module File
_generate_module_cpp(mav_utils_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_utils_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(mav_utils_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(mav_utils_msgs_generate_messages mav_utils_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPose.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_cpp _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPoses.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_cpp _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBox.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_cpp _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBoxes.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_cpp _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterData.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_cpp _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterInfo.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_cpp _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/TaskInfo.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_cpp _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/UTMPose.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_cpp _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/srv/signal.srv" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_cpp _mav_utils_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mav_utils_msgs_gencpp)
add_dependencies(mav_utils_msgs_gencpp mav_utils_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mav_utils_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_eus(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPoses.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_eus(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_eus(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBoxes.msg"
  "${MSG_I_FLAGS}"
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBox.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_eus(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_eus(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterData.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_eus(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/TaskInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_eus(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/UTMPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mav_utils_msgs
)

### Generating Services
_generate_srv_eus(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/srv/signal.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mav_utils_msgs
)

### Generating Module File
_generate_module_eus(mav_utils_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mav_utils_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(mav_utils_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(mav_utils_msgs_generate_messages mav_utils_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPose.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_eus _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPoses.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_eus _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBox.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_eus _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBoxes.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_eus _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterData.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_eus _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterInfo.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_eus _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/TaskInfo.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_eus _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/UTMPose.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_eus _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/srv/signal.srv" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_eus _mav_utils_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mav_utils_msgs_geneus)
add_dependencies(mav_utils_msgs_geneus mav_utils_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mav_utils_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_lisp(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPoses.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_lisp(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_lisp(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBoxes.msg"
  "${MSG_I_FLAGS}"
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBox.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_lisp(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_lisp(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterData.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_lisp(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/TaskInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_lisp(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/UTMPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mav_utils_msgs
)

### Generating Services
_generate_srv_lisp(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/srv/signal.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mav_utils_msgs
)

### Generating Module File
_generate_module_lisp(mav_utils_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mav_utils_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(mav_utils_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(mav_utils_msgs_generate_messages mav_utils_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPose.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_lisp _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPoses.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_lisp _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBox.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_lisp _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBoxes.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_lisp _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterData.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_lisp _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterInfo.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_lisp _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/TaskInfo.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_lisp _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/UTMPose.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_lisp _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/srv/signal.srv" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_lisp _mav_utils_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mav_utils_msgs_genlisp)
add_dependencies(mav_utils_msgs_genlisp mav_utils_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mav_utils_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_nodejs(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPoses.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_nodejs(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_nodejs(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBoxes.msg"
  "${MSG_I_FLAGS}"
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBox.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_nodejs(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_nodejs(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterData.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_nodejs(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/TaskInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_nodejs(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/UTMPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mav_utils_msgs
)

### Generating Services
_generate_srv_nodejs(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/srv/signal.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mav_utils_msgs
)

### Generating Module File
_generate_module_nodejs(mav_utils_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mav_utils_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(mav_utils_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(mav_utils_msgs_generate_messages mav_utils_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPose.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_nodejs _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPoses.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_nodejs _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBox.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_nodejs _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBoxes.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_nodejs _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterData.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_nodejs _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterInfo.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_nodejs _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/TaskInfo.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_nodejs _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/UTMPose.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_nodejs _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/srv/signal.srv" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_nodejs _mav_utils_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mav_utils_msgs_gennodejs)
add_dependencies(mav_utils_msgs_gennodejs mav_utils_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mav_utils_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_py(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPoses.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_py(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_py(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBoxes.msg"
  "${MSG_I_FLAGS}"
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBox.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_py(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_py(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterData.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_py(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/TaskInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_utils_msgs
)
_generate_msg_py(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/UTMPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_utils_msgs
)

### Generating Services
_generate_srv_py(mav_utils_msgs
  "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/srv/signal.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_utils_msgs
)

### Generating Module File
_generate_module_py(mav_utils_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_utils_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(mav_utils_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(mav_utils_msgs_generate_messages mav_utils_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPose.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_py _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBPoses.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_py _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBox.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_py _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/BBoxes.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_py _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterData.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_py _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/RouterInfo.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_py _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/TaskInfo.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_py _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/msg/UTMPose.msg" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_py _mav_utils_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shubh/catkin_ws/src/mav_utils_ariitk/mav_utils_msgs/srv/signal.srv" NAME_WE)
add_dependencies(mav_utils_msgs_generate_messages_py _mav_utils_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mav_utils_msgs_genpy)
add_dependencies(mav_utils_msgs_genpy mav_utils_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mav_utils_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_utils_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_utils_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_cpp)
  add_dependencies(mav_utils_msgs_generate_messages_cpp roscpp_generate_messages_cpp)
endif()
if(TARGET mav_msgs_generate_messages_cpp)
  add_dependencies(mav_utils_msgs_generate_messages_cpp mav_msgs_generate_messages_cpp)
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(mav_utils_msgs_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(mav_utils_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(mav_utils_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET mavros_msgs_generate_messages_cpp)
  add_dependencies(mav_utils_msgs_generate_messages_cpp mavros_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mav_utils_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mav_utils_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_eus)
  add_dependencies(mav_utils_msgs_generate_messages_eus roscpp_generate_messages_eus)
endif()
if(TARGET mav_msgs_generate_messages_eus)
  add_dependencies(mav_utils_msgs_generate_messages_eus mav_msgs_generate_messages_eus)
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(mav_utils_msgs_generate_messages_eus nav_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(mav_utils_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(mav_utils_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET mavros_msgs_generate_messages_eus)
  add_dependencies(mav_utils_msgs_generate_messages_eus mavros_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mav_utils_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mav_utils_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_lisp)
  add_dependencies(mav_utils_msgs_generate_messages_lisp roscpp_generate_messages_lisp)
endif()
if(TARGET mav_msgs_generate_messages_lisp)
  add_dependencies(mav_utils_msgs_generate_messages_lisp mav_msgs_generate_messages_lisp)
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(mav_utils_msgs_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(mav_utils_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(mav_utils_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET mavros_msgs_generate_messages_lisp)
  add_dependencies(mav_utils_msgs_generate_messages_lisp mavros_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mav_utils_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mav_utils_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_nodejs)
  add_dependencies(mav_utils_msgs_generate_messages_nodejs roscpp_generate_messages_nodejs)
endif()
if(TARGET mav_msgs_generate_messages_nodejs)
  add_dependencies(mav_utils_msgs_generate_messages_nodejs mav_msgs_generate_messages_nodejs)
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(mav_utils_msgs_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(mav_utils_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(mav_utils_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET mavros_msgs_generate_messages_nodejs)
  add_dependencies(mav_utils_msgs_generate_messages_nodejs mavros_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_utils_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_utils_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_utils_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_py)
  add_dependencies(mav_utils_msgs_generate_messages_py roscpp_generate_messages_py)
endif()
if(TARGET mav_msgs_generate_messages_py)
  add_dependencies(mav_utils_msgs_generate_messages_py mav_msgs_generate_messages_py)
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(mav_utils_msgs_generate_messages_py nav_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(mav_utils_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(mav_utils_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET mavros_msgs_generate_messages_py)
  add_dependencies(mav_utils_msgs_generate_messages_py mavros_msgs_generate_messages_py)
endif()
