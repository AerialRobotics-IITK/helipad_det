; Auto-generated. Do not edit!


(cl:in-package mav_utils_msgs-srv)


;//! \htmlinclude signal-request.msg.html

(cl:defclass <signal-request> (roslisp-msg-protocol:ros-message)
  ((signal
    :reader signal
    :initarg :signal
    :type cl:fixnum
    :initform 0))
)

(cl:defclass signal-request (<signal-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <signal-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'signal-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mav_utils_msgs-srv:<signal-request> is deprecated: use mav_utils_msgs-srv:signal-request instead.")))

(cl:ensure-generic-function 'signal-val :lambda-list '(m))
(cl:defmethod signal-val ((m <signal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_utils_msgs-srv:signal-val is deprecated.  Use mav_utils_msgs-srv:signal instead.")
  (signal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <signal-request>) ostream)
  "Serializes a message object of type '<signal-request>"
  (cl:let* ((signed (cl:slot-value msg 'signal)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <signal-request>) istream)
  "Deserializes a message object of type '<signal-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'signal) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<signal-request>)))
  "Returns string type for a service object of type '<signal-request>"
  "mav_utils_msgs/signalRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'signal-request)))
  "Returns string type for a service object of type 'signal-request"
  "mav_utils_msgs/signalRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<signal-request>)))
  "Returns md5sum for a message object of type '<signal-request>"
  "473669d0643dcd7ad1f24e08b06be56b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'signal-request)))
  "Returns md5sum for a message object of type 'signal-request"
  "473669d0643dcd7ad1f24e08b06be56b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<signal-request>)))
  "Returns full string definition for message of type '<signal-request>"
  (cl:format cl:nil "int8 signal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'signal-request)))
  "Returns full string definition for message of type 'signal-request"
  (cl:format cl:nil "int8 signal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <signal-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <signal-request>))
  "Converts a ROS message object to a list"
  (cl:list 'signal-request
    (cl:cons ':signal (signal msg))
))
;//! \htmlinclude signal-response.msg.html

(cl:defclass <signal-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass signal-response (<signal-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <signal-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'signal-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mav_utils_msgs-srv:<signal-response> is deprecated: use mav_utils_msgs-srv:signal-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <signal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_utils_msgs-srv:success-val is deprecated.  Use mav_utils_msgs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <signal-response>) ostream)
  "Serializes a message object of type '<signal-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <signal-response>) istream)
  "Deserializes a message object of type '<signal-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<signal-response>)))
  "Returns string type for a service object of type '<signal-response>"
  "mav_utils_msgs/signalResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'signal-response)))
  "Returns string type for a service object of type 'signal-response"
  "mav_utils_msgs/signalResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<signal-response>)))
  "Returns md5sum for a message object of type '<signal-response>"
  "473669d0643dcd7ad1f24e08b06be56b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'signal-response)))
  "Returns md5sum for a message object of type 'signal-response"
  "473669d0643dcd7ad1f24e08b06be56b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<signal-response>)))
  "Returns full string definition for message of type '<signal-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'signal-response)))
  "Returns full string definition for message of type 'signal-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <signal-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <signal-response>))
  "Converts a ROS message object to a list"
  (cl:list 'signal-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'signal)))
  'signal-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'signal)))
  'signal-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'signal)))
  "Returns string type for a service object of type '<signal>"
  "mav_utils_msgs/signal")