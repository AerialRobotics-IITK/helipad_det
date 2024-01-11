;; Auto-generated. Do not edit!


(when (boundp 'mav_utils_msgs::RouterData)
  (if (not (find-package "MAV_UTILS_MSGS"))
    (make-package "MAV_UTILS_MSGS"))
  (shadow 'RouterData (find-package "MAV_UTILS_MSGS")))
(unless (find-package "MAV_UTILS_MSGS::ROUTERDATA")
  (make-package "MAV_UTILS_MSGS::ROUTERDATA"))

(in-package "ROS")
;;//! \htmlinclude RouterData.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass mav_utils_msgs::RouterData
  :super ros::object
  :slots (_id _position ))

(defmethod mav_utils_msgs::RouterData
  (:init
   (&key
    ((:id __id) 0)
    ((:position __position) (instance geometry_msgs::Point :init))
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _position __position)
   self)
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
    ;; int16 _id
    2
    ;; geometry_msgs/Point _position
    (send _position :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _id
       (write-word _id s)
     ;; geometry_msgs/Point _position
       (send _position :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _id
     (setq _id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; geometry_msgs/Point _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;;
   self)
  )

(setf (get mav_utils_msgs::RouterData :md5sum-) "9b89d964391b2067f851638625d693b3")
(setf (get mav_utils_msgs::RouterData :datatype-) "mav_utils_msgs/RouterData")
(setf (get mav_utils_msgs::RouterData :definition-)
      "int16 id
geometry_msgs/Point position

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :mav_utils_msgs/RouterData "9b89d964391b2067f851638625d693b3")


