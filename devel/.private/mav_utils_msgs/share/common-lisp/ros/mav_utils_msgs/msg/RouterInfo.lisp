; Auto-generated. Do not edit!


(cl:in-package mav_utils_msgs-msg)


;//! \htmlinclude RouterInfo.msg.html

(cl:defclass <RouterInfo> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (object_id
    :reader object_id
    :initarg :object_id
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (router_data
    :reader router_data
    :initarg :router_data
    :type (cl:vector mav_utils_msgs-msg:RouterData)
   :initform (cl:make-array 0 :element-type 'mav_utils_msgs-msg:RouterData :initial-element (cl:make-instance 'mav_utils_msgs-msg:RouterData))))
)

(cl:defclass RouterInfo (<RouterInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RouterInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RouterInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mav_utils_msgs-msg:<RouterInfo> is deprecated: use mav_utils_msgs-msg:RouterInfo instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <RouterInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_utils_msgs-msg:header-val is deprecated.  Use mav_utils_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'object_id-val :lambda-list '(m))
(cl:defmethod object_id-val ((m <RouterInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_utils_msgs-msg:object_id-val is deprecated.  Use mav_utils_msgs-msg:object_id instead.")
  (object_id m))

(cl:ensure-generic-function 'router_data-val :lambda-list '(m))
(cl:defmethod router_data-val ((m <RouterInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_utils_msgs-msg:router_data-val is deprecated.  Use mav_utils_msgs-msg:router_data instead.")
  (router_data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RouterInfo>) ostream)
  "Serializes a message object of type '<RouterInfo>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'object_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'object_id))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'router_data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'router_data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RouterInfo>) istream)
  "Deserializes a message object of type '<RouterInfo>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'object_id) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'object_id)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'router_data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'router_data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'mav_utils_msgs-msg:RouterData))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RouterInfo>)))
  "Returns string type for a message object of type '<RouterInfo>"
  "mav_utils_msgs/RouterInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RouterInfo)))
  "Returns string type for a message object of type 'RouterInfo"
  "mav_utils_msgs/RouterInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RouterInfo>)))
  "Returns md5sum for a message object of type '<RouterInfo>"
  "6ff2a8e53da5af51cb59d4d23d6612c0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RouterInfo)))
  "Returns md5sum for a message object of type 'RouterInfo"
  "6ff2a8e53da5af51cb59d4d23d6612c0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RouterInfo>)))
  "Returns full string definition for message of type '<RouterInfo>"
  (cl:format cl:nil "Header header~%int16[] object_id~%RouterData[] router_data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: mav_utils_msgs/RouterData~%int16 id~%geometry_msgs/Point position~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RouterInfo)))
  "Returns full string definition for message of type 'RouterInfo"
  (cl:format cl:nil "Header header~%int16[] object_id~%RouterData[] router_data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: mav_utils_msgs/RouterData~%int16 id~%geometry_msgs/Point position~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RouterInfo>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'object_id) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'router_data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RouterInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'RouterInfo
    (cl:cons ':header (header msg))
    (cl:cons ':object_id (object_id msg))
    (cl:cons ':router_data (router_data msg))
))
