;; Auto-generated. Do not edit!


(when (boundp 'mav_utils_msgs::BBPose)
  (if (not (find-package "MAV_UTILS_MSGS"))
    (make-package "MAV_UTILS_MSGS"))
  (shadow 'BBPose (find-package "MAV_UTILS_MSGS")))
(unless (find-package "MAV_UTILS_MSGS::BBPOSE")
  (make-package "MAV_UTILS_MSGS::BBPOSE"))

(in-package "ROS")
;;//! \htmlinclude BBPose.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass mav_utils_msgs::BBPose
  :super ros::object
  :slots (_boxID _type _area _store _position ))

(defmethod mav_utils_msgs::BBPose
  (:init
   (&key
    ((:boxID __boxID) 0)
    ((:type __type) 0)
    ((:area __area) 0.0)
    ((:store __store) nil)
    ((:position __position) (instance geometry_msgs::Point :init))
    )
   (send-super :init)
   (setq _boxID (round __boxID))
   (setq _type (round __type))
   (setq _area (float __area))
   (setq _store __store)
   (setq _position __position)
   self)
  (:boxID
   (&optional __boxID)
   (if __boxID (setq _boxID __boxID)) _boxID)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:area
   (&optional __area)
   (if __area (setq _area __area)) _area)
  (:store
   (&optional (__store :null))
   (if (not (eq __store :null)) (setq _store __store)) _store)
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
    ;; int32 _boxID
    4
    ;; int32 _type
    4
    ;; float32 _area
    4
    ;; bool _store
    1
    ;; geometry_msgs/Point _position
    (send _position :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _boxID
       (write-long _boxID s)
     ;; int32 _type
       (write-long _type s)
     ;; float32 _area
       (sys::poke _area (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _store
       (if _store (write-byte -1 s) (write-byte 0 s))
     ;; geometry_msgs/Point _position
       (send _position :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _boxID
     (setq _boxID (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _type
     (setq _type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _area
     (setq _area (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _store
     (setq _store (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; geometry_msgs/Point _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;;
   self)
  )

(setf (get mav_utils_msgs::BBPose :md5sum-) "e3a05460e544ead82f2d436e3787794c")
(setf (get mav_utils_msgs::BBPose :datatype-) "mav_utils_msgs/BBPose")
(setf (get mav_utils_msgs::BBPose :definition-)
      "int32 boxID
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



(provide :mav_utils_msgs/BBPose "e3a05460e544ead82f2d436e3787794c")


