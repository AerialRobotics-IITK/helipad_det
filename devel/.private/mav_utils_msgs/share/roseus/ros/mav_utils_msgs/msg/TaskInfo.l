;; Auto-generated. Do not edit!


(when (boundp 'mav_utils_msgs::TaskInfo)
  (if (not (find-package "MAV_UTILS_MSGS"))
    (make-package "MAV_UTILS_MSGS"))
  (shadow 'TaskInfo (find-package "MAV_UTILS_MSGS")))
(unless (find-package "MAV_UTILS_MSGS::TASKINFO")
  (make-package "MAV_UTILS_MSGS::TASKINFO"))

(in-package "ROS")
;;//! \htmlinclude TaskInfo.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass mav_utils_msgs::TaskInfo
  :super ros::object
  :slots (_header _loc_type _id _position ))

(defmethod mav_utils_msgs::TaskInfo
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:loc_type __loc_type) "")
    ((:id __id) 0)
    ((:position __position) (instance geometry_msgs::Point :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _loc_type (string __loc_type))
   (setq _id (round __id))
   (setq _position __position)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:loc_type
   (&optional __loc_type)
   (if __loc_type (setq _loc_type __loc_type)) _loc_type)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _loc_type
    4 (length _loc_type)
    ;; int32 _id
    4
    ;; geometry_msgs/Point _position
    (send _position :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _loc_type
       (write-long (length _loc_type) s) (princ _loc_type s)
     ;; int32 _id
       (write-long _id s)
     ;; geometry_msgs/Point _position
       (send _position :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _loc_type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _loc_type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; geometry_msgs/Point _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;;
   self)
  )

(setf (get mav_utils_msgs::TaskInfo :md5sum-) "7aa2f2a193cf1ff9ec2367d5c3263859")
(setf (get mav_utils_msgs::TaskInfo :datatype-) "mav_utils_msgs/TaskInfo")
(setf (get mav_utils_msgs::TaskInfo :definition-)
      "Header header
string loc_type
int32 id
geometry_msgs/Point position

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
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :mav_utils_msgs/TaskInfo "7aa2f2a193cf1ff9ec2367d5c3263859")


