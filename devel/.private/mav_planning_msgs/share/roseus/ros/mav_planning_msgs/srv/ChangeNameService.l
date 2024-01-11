;; Auto-generated. Do not edit!


(when (boundp 'mav_planning_msgs::ChangeNameService)
  (if (not (find-package "MAV_PLANNING_MSGS"))
    (make-package "MAV_PLANNING_MSGS"))
  (shadow 'ChangeNameService (find-package "MAV_PLANNING_MSGS")))
(unless (find-package "MAV_PLANNING_MSGS::CHANGENAMESERVICE")
  (make-package "MAV_PLANNING_MSGS::CHANGENAMESERVICE"))
(unless (find-package "MAV_PLANNING_MSGS::CHANGENAMESERVICEREQUEST")
  (make-package "MAV_PLANNING_MSGS::CHANGENAMESERVICEREQUEST"))
(unless (find-package "MAV_PLANNING_MSGS::CHANGENAMESERVICERESPONSE")
  (make-package "MAV_PLANNING_MSGS::CHANGENAMESERVICERESPONSE"))

(in-package "ROS")





(defclass mav_planning_msgs::ChangeNameServiceRequest
  :super ros::object
  :slots (_name ))

(defmethod mav_planning_msgs::ChangeNameServiceRequest
  (:init
   (&key
    ((:name __name) "")
    )
   (send-super :init)
   (setq _name (string __name))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass mav_planning_msgs::ChangeNameServiceResponse
  :super ros::object
  :slots (_success _message ))

(defmethod mav_planning_msgs::ChangeNameServiceResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass mav_planning_msgs::ChangeNameService
  :super ros::object
  :slots ())

(setf (get mav_planning_msgs::ChangeNameService :md5sum-) "d82dc6474dd88dad5e1615ab1b2ca74c")
(setf (get mav_planning_msgs::ChangeNameService :datatype-) "mav_planning_msgs/ChangeNameService")
(setf (get mav_planning_msgs::ChangeNameService :request) mav_planning_msgs::ChangeNameServiceRequest)
(setf (get mav_planning_msgs::ChangeNameService :response) mav_planning_msgs::ChangeNameServiceResponse)

(defmethod mav_planning_msgs::ChangeNameServiceRequest
  (:response () (instance mav_planning_msgs::ChangeNameServiceResponse :init)))

(setf (get mav_planning_msgs::ChangeNameServiceRequest :md5sum-) "d82dc6474dd88dad5e1615ab1b2ca74c")
(setf (get mav_planning_msgs::ChangeNameServiceRequest :datatype-) "mav_planning_msgs/ChangeNameServiceRequest")
(setf (get mav_planning_msgs::ChangeNameServiceRequest :definition-)
      "#request fields
string name
---
# True on success, false on failure
bool success
string message

")

(setf (get mav_planning_msgs::ChangeNameServiceResponse :md5sum-) "d82dc6474dd88dad5e1615ab1b2ca74c")
(setf (get mav_planning_msgs::ChangeNameServiceResponse :datatype-) "mav_planning_msgs/ChangeNameServiceResponse")
(setf (get mav_planning_msgs::ChangeNameServiceResponse :definition-)
      "#request fields
string name
---
# True on success, false on failure
bool success
string message

")



(provide :mav_planning_msgs/ChangeNameService "d82dc6474dd88dad5e1615ab1b2ca74c")


