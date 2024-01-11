;; Auto-generated. Do not edit!


(when (boundp 'mav_utils_msgs::UTMPose)
  (if (not (find-package "MAV_UTILS_MSGS"))
    (make-package "MAV_UTILS_MSGS"))
  (shadow 'UTMPose (find-package "MAV_UTILS_MSGS")))
(unless (find-package "MAV_UTILS_MSGS::UTMPOSE")
  (make-package "MAV_UTILS_MSGS::UTMPOSE"))

(in-package "ROS")
;;//! \htmlinclude UTMPose.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass mav_utils_msgs::UTMPose
  :super ros::object
  :slots (_header _pose _linear_twist ))

(defmethod mav_utils_msgs::UTMPose
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    ((:linear_twist __linear_twist) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _pose __pose)
   (setq _linear_twist __linear_twist)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:linear_twist
   (&rest __linear_twist)
   (if (keywordp (car __linear_twist))
       (send* _linear_twist __linear_twist)
     (progn
       (if __linear_twist (setq _linear_twist (car __linear_twist)))
       _linear_twist)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ;; geometry_msgs/Vector3 _linear_twist
    (send _linear_twist :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;; geometry_msgs/Vector3 _linear_twist
       (send _linear_twist :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; geometry_msgs/Vector3 _linear_twist
     (send _linear_twist :deserialize buf ptr-) (incf ptr- (send _linear_twist :serialization-length))
   ;;
   self)
  )

(setf (get mav_utils_msgs::UTMPose :md5sum-) "b5f08bd7507ad9a363bb7722518a014f")
(setf (get mav_utils_msgs::UTMPose :datatype-) "mav_utils_msgs/UTMPose")
(setf (get mav_utils_msgs::UTMPose :definition-)
      "std_msgs/Header header
geometry_msgs/Pose pose
geometry_msgs/Vector3 linear_twist

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :mav_utils_msgs/UTMPose "b5f08bd7507ad9a363bb7722518a014f")


