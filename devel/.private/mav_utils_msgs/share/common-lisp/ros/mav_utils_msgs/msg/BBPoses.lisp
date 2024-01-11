; Auto-generated. Do not edit!


(cl:in-package mav_utils_msgs-msg)


;//! \htmlinclude BBPoses.msg.html

(cl:defclass <BBPoses> (roslisp-msg-protocol:ros-message)
  ((stamp
    :reader stamp
    :initarg :stamp
    :type cl:real
    :initform 0)
   (imageID
    :reader imageID
    :initarg :imageID
    :type cl:integer
    :initform 0)
   (object_poses
    :reader object_poses
    :initarg :object_poses
    :type (cl:vector mav_utils_msgs-msg:BBPose)
   :initform (cl:make-array 0 :element-type 'mav_utils_msgs-msg:BBPose :initial-element (cl:make-instance 'mav_utils_msgs-msg:BBPose))))
)

(cl:defclass BBPoses (<BBPoses>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BBPoses>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BBPoses)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mav_utils_msgs-msg:<BBPoses> is deprecated: use mav_utils_msgs-msg:BBPoses instead.")))

(cl:ensure-generic-function 'stamp-val :lambda-list '(m))
(cl:defmethod stamp-val ((m <BBPoses>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_utils_msgs-msg:stamp-val is deprecated.  Use mav_utils_msgs-msg:stamp instead.")
  (stamp m))

(cl:ensure-generic-function 'imageID-val :lambda-list '(m))
(cl:defmethod imageID-val ((m <BBPoses>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_utils_msgs-msg:imageID-val is deprecated.  Use mav_utils_msgs-msg:imageID instead.")
  (imageID m))

(cl:ensure-generic-function 'object_poses-val :lambda-list '(m))
(cl:defmethod object_poses-val ((m <BBPoses>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_utils_msgs-msg:object_poses-val is deprecated.  Use mav_utils_msgs-msg:object_poses instead.")
  (object_poses m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BBPoses>) ostream)
  "Serializes a message object of type '<BBPoses>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'stamp)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'stamp) (cl:floor (cl:slot-value msg 'stamp)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:let* ((signed (cl:slot-value msg 'imageID)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'object_poses))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'object_poses))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BBPoses>) istream)
  "Deserializes a message object of type '<BBPoses>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'stamp) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'imageID) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'object_poses) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'object_poses)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'mav_utils_msgs-msg:BBPose))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BBPoses>)))
  "Returns string type for a message object of type '<BBPoses>"
  "mav_utils_msgs/BBPoses")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BBPoses)))
  "Returns string type for a message object of type 'BBPoses"
  "mav_utils_msgs/BBPoses")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BBPoses>)))
  "Returns md5sum for a message object of type '<BBPoses>"
  "ed4ca9b702b46a3d3b707fa59df1e978")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BBPoses)))
  "Returns md5sum for a message object of type 'BBPoses"
  "ed4ca9b702b46a3d3b707fa59df1e978")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BBPoses>)))
  "Returns full string definition for message of type '<BBPoses>"
  (cl:format cl:nil "time stamp~%int32 imageID~%BBPose[] object_poses~%~%================================================================================~%MSG: mav_utils_msgs/BBPose~%int32 boxID~%int32 type~%float32 area~%bool store~%geometry_msgs/Point position~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BBPoses)))
  "Returns full string definition for message of type 'BBPoses"
  (cl:format cl:nil "time stamp~%int32 imageID~%BBPose[] object_poses~%~%================================================================================~%MSG: mav_utils_msgs/BBPose~%int32 boxID~%int32 type~%float32 area~%bool store~%geometry_msgs/Point position~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BBPoses>))
  (cl:+ 0
     8
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'object_poses) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BBPoses>))
  "Converts a ROS message object to a list"
  (cl:list 'BBPoses
    (cl:cons ':stamp (stamp msg))
    (cl:cons ':imageID (imageID msg))
    (cl:cons ':object_poses (object_poses msg))
))
