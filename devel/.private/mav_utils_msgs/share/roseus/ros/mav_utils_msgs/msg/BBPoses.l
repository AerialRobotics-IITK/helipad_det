;; Auto-generated. Do not edit!


(when (boundp 'mav_utils_msgs::BBPoses)
  (if (not (find-package "MAV_UTILS_MSGS"))
    (make-package "MAV_UTILS_MSGS"))
  (shadow 'BBPoses (find-package "MAV_UTILS_MSGS")))
(unless (find-package "MAV_UTILS_MSGS::BBPOSES")
  (make-package "MAV_UTILS_MSGS::BBPOSES"))

(in-package "ROS")
;;//! \htmlinclude BBPoses.msg.html


(defclass mav_utils_msgs::BBPoses
  :super ros::object
  :slots (_stamp _imageID _object_poses ))

(defmethod mav_utils_msgs::BBPoses
  (:init
   (&key
    ((:stamp __stamp) (instance ros::time :init))
    ((:imageID __imageID) 0)
    ((:object_poses __object_poses) ())
    )
   (send-super :init)
   (setq _stamp __stamp)
   (setq _imageID (round __imageID))
   (setq _object_poses __object_poses)
   self)
  (:stamp
   (&optional __stamp)
   (if __stamp (setq _stamp __stamp)) _stamp)
  (:imageID
   (&optional __imageID)
   (if __imageID (setq _imageID __imageID)) _imageID)
  (:object_poses
   (&rest __object_poses)
   (if (keywordp (car __object_poses))
       (send* _object_poses __object_poses)
     (progn
       (if __object_poses (setq _object_poses (car __object_poses)))
       _object_poses)))
  (:serialization-length
   ()
   (+
    ;; time _stamp
    8
    ;; int32 _imageID
    4
    ;; mav_utils_msgs/BBPose[] _object_poses
    (apply #'+ (send-all _object_poses :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _stamp
       (write-long (send _stamp :sec) s) (write-long (send _stamp :nsec) s)
     ;; int32 _imageID
       (write-long _imageID s)
     ;; mav_utils_msgs/BBPose[] _object_poses
     (write-long (length _object_poses) s)
     (dolist (elem _object_poses)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _stamp
     (send _stamp :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _stamp :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _imageID
     (setq _imageID (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; mav_utils_msgs/BBPose[] _object_poses
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _object_poses (let (r) (dotimes (i n) (push (instance mav_utils_msgs::BBPose :init) r)) r))
     (dolist (elem- _object_poses)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get mav_utils_msgs::BBPoses :md5sum-) "ed4ca9b702b46a3d3b707fa59df1e978")
(setf (get mav_utils_msgs::BBPoses :datatype-) "mav_utils_msgs/BBPoses")
(setf (get mav_utils_msgs::BBPoses :definition-)
      "time stamp
int32 imageID
BBPose[] object_poses

================================================================================
MSG: mav_utils_msgs/BBPose
int32 boxID
int32 type
float32 area
bool store
geometry_msgs/Point position

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :mav_utils_msgs/BBPoses "ed4ca9b702b46a3d3b707fa59df1e978")


