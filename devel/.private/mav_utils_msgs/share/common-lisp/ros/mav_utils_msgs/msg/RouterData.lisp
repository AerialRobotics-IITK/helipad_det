; Auto-generated. Do not edit!


(cl:in-package mav_utils_msgs-msg)


;//! \htmlinclude RouterData.msg.html

(cl:defclass <RouterData> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (position
    :reader position
    :initarg :position
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point)))
)

(cl:defclass RouterData (<RouterData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RouterData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RouterData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mav_utils_msgs-msg:<RouterData> is deprecated: use mav_utils_msgs-msg:RouterData instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <RouterData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_utils_msgs-msg:id-val is deprecated.  Use mav_utils_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <RouterData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_utils_msgs-msg:position-val is deprecated.  Use mav_utils_msgs-msg:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RouterData>) ostream)
  "Serializes a message object of type '<RouterData>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RouterData>) istream)
  "Deserializes a message object of type '<RouterData>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RouterData>)))
  "Returns string type for a message object of type '<RouterData>"
  "mav_utils_msgs/RouterData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RouterData)))
  "Returns string type for a message object of type 'RouterData"
  "mav_utils_msgs/RouterData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RouterData>)))
  "Returns md5sum for a message object of type '<RouterData>"
  "9b89d964391b2067f851638625d693b3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RouterData)))
  "Returns md5sum for a message object of type 'RouterData"
  "9b89d964391b2067f851638625d693b3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RouterData>)))
  "Returns full string definition for message of type '<RouterData>"
  (cl:format cl:nil "int16 id~%geometry_msgs/Point position~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RouterData)))
  "Returns full string definition for message of type 'RouterData"
  (cl:format cl:nil "int16 id~%geometry_msgs/Point position~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RouterData>))
  (cl:+ 0
     2
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RouterData>))
  "Converts a ROS message object to a list"
  (cl:list 'RouterData
    (cl:cons ':id (id msg))
    (cl:cons ':position (position msg))
))
