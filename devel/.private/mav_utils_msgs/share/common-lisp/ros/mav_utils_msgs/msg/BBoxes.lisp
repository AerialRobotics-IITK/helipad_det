; Auto-generated. Do not edit!


(cl:in-package mav_utils_msgs-msg)


;//! \htmlinclude BBoxes.msg.html

(cl:defclass <BBoxes> (roslisp-msg-protocol:ros-message)
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
   (objects
    :reader objects
    :initarg :objects
    :type (cl:vector mav_utils_msgs-msg:BBox)
   :initform (cl:make-array 0 :element-type 'mav_utils_msgs-msg:BBox :initial-element (cl:make-instance 'mav_utils_msgs-msg:BBox))))
)

(cl:defclass BBoxes (<BBoxes>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BBoxes>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BBoxes)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mav_utils_msgs-msg:<BBoxes> is deprecated: use mav_utils_msgs-msg:BBoxes instead.")))

(cl:ensure-generic-function 'stamp-val :lambda-list '(m))
(cl:defmethod stamp-val ((m <BBoxes>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_utils_msgs-msg:stamp-val is deprecated.  Use mav_utils_msgs-msg:stamp instead.")
  (stamp m))

(cl:ensure-generic-function 'imageID-val :lambda-list '(m))
(cl:defmethod imageID-val ((m <BBoxes>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_utils_msgs-msg:imageID-val is deprecated.  Use mav_utils_msgs-msg:imageID instead.")
  (imageID m))

(cl:ensure-generic-function 'objects-val :lambda-list '(m))
(cl:defmethod objects-val ((m <BBoxes>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_utils_msgs-msg:objects-val is deprecated.  Use mav_utils_msgs-msg:objects instead.")
  (objects m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BBoxes>) ostream)
  "Serializes a message object of type '<BBoxes>"
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
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'objects))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'objects))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BBoxes>) istream)
  "Deserializes a message object of type '<BBoxes>"
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
  (cl:setf (cl:slot-value msg 'objects) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'objects)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'mav_utils_msgs-msg:BBox))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BBoxes>)))
  "Returns string type for a message object of type '<BBoxes>"
  "mav_utils_msgs/BBoxes")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BBoxes)))
  "Returns string type for a message object of type 'BBoxes"
  "mav_utils_msgs/BBoxes")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BBoxes>)))
  "Returns md5sum for a message object of type '<BBoxes>"
  "132eb21f59342318bc09c3939b6621fb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BBoxes)))
  "Returns md5sum for a message object of type 'BBoxes"
  "132eb21f59342318bc09c3939b6621fb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BBoxes>)))
  "Returns full string definition for message of type '<BBoxes>"
  (cl:format cl:nil "time stamp~%int32 imageID~%BBox[] objects~%~%================================================================================~%MSG: mav_utils_msgs/BBox~%int32 boxID~%int32 pixSize~%int32 contourSize~%string colour~%float32 diagIndex~%float32 areaIndex~%float32 eigenIndex~%int32[] rangeX~%int32[] rangeY~%float32[] centre~%float32[] cornerX~%float32[] cornerY~%float32[] eigenVal~%float32[] eigenVec~%int32[] contourX~%int32[] contourY~%bool full~%bool store~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BBoxes)))
  "Returns full string definition for message of type 'BBoxes"
  (cl:format cl:nil "time stamp~%int32 imageID~%BBox[] objects~%~%================================================================================~%MSG: mav_utils_msgs/BBox~%int32 boxID~%int32 pixSize~%int32 contourSize~%string colour~%float32 diagIndex~%float32 areaIndex~%float32 eigenIndex~%int32[] rangeX~%int32[] rangeY~%float32[] centre~%float32[] cornerX~%float32[] cornerY~%float32[] eigenVal~%float32[] eigenVec~%int32[] contourX~%int32[] contourY~%bool full~%bool store~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BBoxes>))
  (cl:+ 0
     8
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'objects) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BBoxes>))
  "Converts a ROS message object to a list"
  (cl:list 'BBoxes
    (cl:cons ':stamp (stamp msg))
    (cl:cons ':imageID (imageID msg))
    (cl:cons ':objects (objects msg))
))
