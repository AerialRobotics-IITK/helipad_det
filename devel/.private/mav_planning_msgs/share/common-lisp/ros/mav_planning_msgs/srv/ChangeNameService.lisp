; Auto-generated. Do not edit!


(cl:in-package mav_planning_msgs-srv)


;//! \htmlinclude ChangeNameService-request.msg.html

(cl:defclass <ChangeNameService-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass ChangeNameService-request (<ChangeNameService-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChangeNameService-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChangeNameService-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mav_planning_msgs-srv:<ChangeNameService-request> is deprecated: use mav_planning_msgs-srv:ChangeNameService-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <ChangeNameService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_planning_msgs-srv:name-val is deprecated.  Use mav_planning_msgs-srv:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChangeNameService-request>) ostream)
  "Serializes a message object of type '<ChangeNameService-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChangeNameService-request>) istream)
  "Deserializes a message object of type '<ChangeNameService-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChangeNameService-request>)))
  "Returns string type for a service object of type '<ChangeNameService-request>"
  "mav_planning_msgs/ChangeNameServiceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeNameService-request)))
  "Returns string type for a service object of type 'ChangeNameService-request"
  "mav_planning_msgs/ChangeNameServiceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChangeNameService-request>)))
  "Returns md5sum for a message object of type '<ChangeNameService-request>"
  "d82dc6474dd88dad5e1615ab1b2ca74c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChangeNameService-request)))
  "Returns md5sum for a message object of type 'ChangeNameService-request"
  "d82dc6474dd88dad5e1615ab1b2ca74c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChangeNameService-request>)))
  "Returns full string definition for message of type '<ChangeNameService-request>"
  (cl:format cl:nil "#request fields~%string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChangeNameService-request)))
  "Returns full string definition for message of type 'ChangeNameService-request"
  (cl:format cl:nil "#request fields~%string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChangeNameService-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChangeNameService-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ChangeNameService-request
    (cl:cons ':name (name msg))
))
;//! \htmlinclude ChangeNameService-response.msg.html

(cl:defclass <ChangeNameService-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass ChangeNameService-response (<ChangeNameService-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChangeNameService-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChangeNameService-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mav_planning_msgs-srv:<ChangeNameService-response> is deprecated: use mav_planning_msgs-srv:ChangeNameService-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <ChangeNameService-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_planning_msgs-srv:success-val is deprecated.  Use mav_planning_msgs-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <ChangeNameService-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_planning_msgs-srv:message-val is deprecated.  Use mav_planning_msgs-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChangeNameService-response>) ostream)
  "Serializes a message object of type '<ChangeNameService-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChangeNameService-response>) istream)
  "Deserializes a message object of type '<ChangeNameService-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChangeNameService-response>)))
  "Returns string type for a service object of type '<ChangeNameService-response>"
  "mav_planning_msgs/ChangeNameServiceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeNameService-response)))
  "Returns string type for a service object of type 'ChangeNameService-response"
  "mav_planning_msgs/ChangeNameServiceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChangeNameService-response>)))
  "Returns md5sum for a message object of type '<ChangeNameService-response>"
  "d82dc6474dd88dad5e1615ab1b2ca74c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChangeNameService-response)))
  "Returns md5sum for a message object of type 'ChangeNameService-response"
  "d82dc6474dd88dad5e1615ab1b2ca74c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChangeNameService-response>)))
  "Returns full string definition for message of type '<ChangeNameService-response>"
  (cl:format cl:nil "# True on success, false on failure~%bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChangeNameService-response)))
  "Returns full string definition for message of type 'ChangeNameService-response"
  (cl:format cl:nil "# True on success, false on failure~%bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChangeNameService-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChangeNameService-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ChangeNameService-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ChangeNameService)))
  'ChangeNameService-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ChangeNameService)))
  'ChangeNameService-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeNameService)))
  "Returns string type for a service object of type '<ChangeNameService>"
  "mav_planning_msgs/ChangeNameService")