;; Auto-generated. Do not edit!


(when (boundp 'mav_utils_msgs::signal)
  (if (not (find-package "MAV_UTILS_MSGS"))
    (make-package "MAV_UTILS_MSGS"))
  (shadow 'signal (find-package "MAV_UTILS_MSGS")))
(unless (find-package "MAV_UTILS_MSGS::SIGNAL")
  (make-package "MAV_UTILS_MSGS::SIGNAL"))
(unless (find-package "MAV_UTILS_MSGS::SIGNALREQUEST")
  (make-package "MAV_UTILS_MSGS::SIGNALREQUEST"))
(unless (find-package "MAV_UTILS_MSGS::SIGNALRESPONSE")
  (make-package "MAV_UTILS_MSGS::SIGNALRESPONSE"))

(in-package "ROS")





(defclass mav_utils_msgs::signalRequest
  :super ros::object
  :slots (_signal ))

(defmethod mav_utils_msgs::signalRequest
  (:init
   (&key
    ((:signal __signal) 0)
    )
   (send-super :init)
   (setq _signal (round __signal))
   self)
  (:signal
   (&optional __signal)
   (if __signal (setq _signal __signal)) _signal)
  (:serialization-length
   ()
   (+
    ;; int8 _signal
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _signal
       (write-byte _signal s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _signal
     (setq _signal (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _signal 127) (setq _signal (- _signal 256)))
   ;;
   self)
  )

(defclass mav_utils_msgs::signalResponse
  :super ros::object
  :slots (_success ))

(defmethod mav_utils_msgs::signalResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass mav_utils_msgs::signal
  :super ros::object
  :slots ())

(setf (get mav_utils_msgs::signal :md5sum-) "473669d0643dcd7ad1f24e08b06be56b")
(setf (get mav_utils_msgs::signal :datatype-) "mav_utils_msgs/signal")
(setf (get mav_utils_msgs::signal :request) mav_utils_msgs::signalRequest)
(setf (get mav_utils_msgs::signal :response) mav_utils_msgs::signalResponse)

(defmethod mav_utils_msgs::signalRequest
  (:response () (instance mav_utils_msgs::signalResponse :init)))

(setf (get mav_utils_msgs::signalRequest :md5sum-) "473669d0643dcd7ad1f24e08b06be56b")
(setf (get mav_utils_msgs::signalRequest :datatype-) "mav_utils_msgs/signalRequest")
(setf (get mav_utils_msgs::signalRequest :definition-)
      "int8 signal
---
bool success

")

(setf (get mav_utils_msgs::signalResponse :md5sum-) "473669d0643dcd7ad1f24e08b06be56b")
(setf (get mav_utils_msgs::signalResponse :datatype-) "mav_utils_msgs/signalResponse")
(setf (get mav_utils_msgs::signalResponse :definition-)
      "int8 signal
---
bool success

")



(provide :mav_utils_msgs/signal "473669d0643dcd7ad1f24e08b06be56b")


