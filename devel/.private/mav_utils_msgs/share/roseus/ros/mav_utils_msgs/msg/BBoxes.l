;; Auto-generated. Do not edit!


(when (boundp 'mav_utils_msgs::BBoxes)
  (if (not (find-package "MAV_UTILS_MSGS"))
    (make-package "MAV_UTILS_MSGS"))
  (shadow 'BBoxes (find-package "MAV_UTILS_MSGS")))
(unless (find-package "MAV_UTILS_MSGS::BBOXES")
  (make-package "MAV_UTILS_MSGS::BBOXES"))

(in-package "ROS")
;;//! \htmlinclude BBoxes.msg.html


(defclass mav_utils_msgs::BBoxes
  :super ros::object
  :slots (_stamp _imageID _objects ))

(defmethod mav_utils_msgs::BBoxes
  (:init
   (&key
    ((:stamp __stamp) (instance ros::time :init))
    ((:imageID __imageID) 0)
    ((:objects __objects) ())
    )
   (send-super :init)
   (setq _stamp __stamp)
   (setq _imageID (round __imageID))
   (setq _objects __objects)
   self)
  (:stamp
   (&optional __stamp)
   (if __stamp (setq _stamp __stamp)) _stamp)
  (:imageID
   (&optional __imageID)
   (if __imageID (setq _imageID __imageID)) _imageID)
  (:objects
   (&rest __objects)
   (if (keywordp (car __objects))
       (send* _objects __objects)
     (progn
       (if __objects (setq _objects (car __objects)))
       _objects)))
  (:serialization-length
   ()
   (+
    ;; time _stamp
    8
    ;; int32 _imageID
    4
    ;; mav_utils_msgs/BBox[] _objects
    (apply #'+ (send-all _objects :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _stamp
       (write-long (send _stamp :sec) s) (write-long (send _stamp :nsec) s)
     ;; int32 _imageID
       (write-long _imageID s)
     ;; mav_utils_msgs/BBox[] _objects
     (write-long (length _objects) s)
     (dolist (elem _objects)
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
   ;; mav_utils_msgs/BBox[] _objects
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _objects (let (r) (dotimes (i n) (push (instance mav_utils_msgs::BBox :init) r)) r))
     (dolist (elem- _objects)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get mav_utils_msgs::BBoxes :md5sum-) "132eb21f59342318bc09c3939b6621fb")
(setf (get mav_utils_msgs::BBoxes :datatype-) "mav_utils_msgs/BBoxes")
(setf (get mav_utils_msgs::BBoxes :definition-)
      "time stamp
int32 imageID
BBox[] objects

================================================================================
MSG: mav_utils_msgs/BBox
int32 boxID
int32 pixSize
int32 contourSize
string colour
float32 diagIndex
float32 areaIndex
float32 eigenIndex
int32[] rangeX
int32[] rangeY
float32[] centre
float32[] cornerX
float32[] cornerY
float32[] eigenVal
float32[] eigenVec
int32[] contourX
int32[] contourY
bool full
bool store

")



(provide :mav_utils_msgs/BBoxes "132eb21f59342318bc09c3939b6621fb")


