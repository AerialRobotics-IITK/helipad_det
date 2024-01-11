;; Auto-generated. Do not edit!


(when (boundp 'mav_utils_msgs::RouterInfo)
  (if (not (find-package "MAV_UTILS_MSGS"))
    (make-package "MAV_UTILS_MSGS"))
  (shadow 'RouterInfo (find-package "MAV_UTILS_MSGS")))
(unless (find-package "MAV_UTILS_MSGS::ROUTERINFO")
  (make-package "MAV_UTILS_MSGS::ROUTERINFO"))

(in-package "ROS")
;;//! \htmlinclude RouterInfo.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass mav_utils_msgs::RouterInfo
  :super ros::object
  :slots (_header _object_id _router_data ))

(defmethod mav_utils_msgs::RouterInfo
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:object_id __object_id) (make-array 0 :initial-element 0 :element-type :integer))
    ((:router_data __router_data) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _object_id __object_id)
   (setq _router_data __router_data)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:object_id
   (&optional __object_id)
   (if __object_id (setq _object_id __object_id)) _object_id)
  (:router_data
   (&rest __router_data)
   (if (keywordp (car __router_data))
       (send* _router_data __router_data)
     (progn
       (if __router_data (setq _router_data (car __router_data)))
       _router_data)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int16[] _object_id
    (* 2    (length _object_id)) 4
    ;; mav_utils_msgs/RouterData[] _router_data
    (apply #'+ (send-all _router_data :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int16[] _object_id
     (write-long (length _object_id) s)
     (dotimes (i (length _object_id))
       (write-word (elt _object_id i) s)
       )
     ;; mav_utils_msgs/RouterData[] _router_data
     (write-long (length _router_data) s)
     (dolist (elem _router_data)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int16[] _object_id
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _object_id (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _object_id i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; mav_utils_msgs/RouterData[] _router_data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _router_data (let (r) (dotimes (i n) (push (instance mav_utils_msgs::RouterData :init) r)) r))
     (dolist (elem- _router_data)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get mav_utils_msgs::RouterInfo :md5sum-) "6ff2a8e53da5af51cb59d4d23d6612c0")
(setf (get mav_utils_msgs::RouterInfo :datatype-) "mav_utils_msgs/RouterInfo")
(setf (get mav_utils_msgs::RouterInfo :definition-)
      "Header header
int16[] object_id
RouterData[] router_data

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
MSG: mav_utils_msgs/RouterData
int16 id
geometry_msgs/Point position

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :mav_utils_msgs/RouterInfo "6ff2a8e53da5af51cb59d4d23d6612c0")


