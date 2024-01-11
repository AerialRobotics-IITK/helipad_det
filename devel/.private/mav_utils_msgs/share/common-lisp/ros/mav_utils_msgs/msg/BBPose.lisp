; Auto-generated. Do not edit!


(cl:in-package mav_utils_msgs-msg)


;//! \htmlinclude BBPose.msg.html

(cl:defclass <BBPose> (roslisp-msg-protocol:ros-message)
  ((boxID
    :reader boxID
    :initarg :boxID
    :type cl:integer
    :initform 0)
   (type
    :reader type
    :initarg :type
    :type cl:integer
    :initform 0)
   (area
    :reader area
    :initarg :area
    :type cl:float
    :initform 0.0)
   (store
    :reader store
    :initarg :store
    :type cl:boolean
    :initform cl:nil)
   (position
    :reader position
    :initarg :position
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point)))
)

(cl:defclass BBPose (<BBPose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BBPose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BBPose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mav_utils_msgs-msg:<BBPose> is deprecated: use mav_utils_msgs-msg:BBPose instead.")))

(cl:ensure-generic-function 'boxID-val :lambda-list '(m))
(cl:defmethod boxID-val ((m <BBPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_utils_msgs-msg:boxID-val is deprecated.  Use mav_utils_msgs-msg:boxID instead.")
  (boxID m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <BBPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_utils_msgs-msg:type-val is deprecated.  Use mav_utils_msgs-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'area-val :lambda-list '(m))
(cl:defmethod area-val ((m <BBPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_utils_msgs-msg:area-val is deprecated.  Use mav_utils_msgs-msg:area instead.")
  (area m))

(cl:ensure-generic-function 'store-val :lambda-list '(m))
(cl:defmethod store-val ((m <BBPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_utils_msgs-msg:store-val is deprecated.  Use mav_utils_msgs-msg:store instead.")
  (store m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <BBPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_utils_msgs-msg:position-val is deprecated.  Use mav_utils_msgs-msg:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BBPose>) ostream)
  "Serializes a message object of type '<BBPose>"
  (cl:let* ((signed (cl:slot-value msg 'boxID)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'area))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'store) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BBPose>) istream)
  "Deserializes a message object of type '<BBPose>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'boxID) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'area) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'store) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BBPose>)))
  "Returns string type for a message object of type '<BBPose>"
  "mav_utils_msgs/BBPose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BBPose)))
  "Returns string type for a message object of type 'BBPose"
  "mav_utils_msgs/BBPose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BBPose>)))
  "Returns md5sum for a message object of type '<BBPose>"
  "e3a05460e544ead82f2d436e3787794c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BBPose)))
  "Returns md5sum for a message object of type 'BBPose"
  "e3a05460e544ead82f2d436e3787794c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BBPose>)))
  "Returns full string definition for message of type '<BBPose>"
  (cl:format cl:nil "int32 boxID~%int32 type~%float32 area~%bool store~%geometry_msgs/Point position~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BBPose)))
  "Returns full string definition for message of type 'BBPose"
  (cl:format cl:nil "int32 boxID~%int32 type~%float32 area~%bool store~%geometry_msgs/Point position~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BBPose>))
  (cl:+ 0
     4
     4
     4
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BBPose>))
  "Converts a ROS message object to a list"
  (cl:list 'BBPose
    (cl:cons ':boxID (boxID msg))
    (cl:cons ':type (type msg))
    (cl:cons ':area (area msg))
    (cl:cons ':store (store msg))
    (cl:cons ':position (position msg))
))
