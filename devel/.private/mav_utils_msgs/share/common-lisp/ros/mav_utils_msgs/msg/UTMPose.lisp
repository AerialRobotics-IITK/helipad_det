; Auto-generated. Do not edit!


(cl:in-package mav_utils_msgs-msg)


;//! \htmlinclude UTMPose.msg.html

(cl:defclass <UTMPose> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (linear_twist
    :reader linear_twist
    :initarg :linear_twist
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass UTMPose (<UTMPose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <UTMPose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'UTMPose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mav_utils_msgs-msg:<UTMPose> is deprecated: use mav_utils_msgs-msg:UTMPose instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <UTMPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_utils_msgs-msg:header-val is deprecated.  Use mav_utils_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <UTMPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_utils_msgs-msg:pose-val is deprecated.  Use mav_utils_msgs-msg:pose instead.")
  (pose m))

(cl:ensure-generic-function 'linear_twist-val :lambda-list '(m))
(cl:defmethod linear_twist-val ((m <UTMPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mav_utils_msgs-msg:linear_twist-val is deprecated.  Use mav_utils_msgs-msg:linear_twist instead.")
  (linear_twist m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <UTMPose>) ostream)
  "Serializes a message object of type '<UTMPose>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'linear_twist) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <UTMPose>) istream)
  "Deserializes a message object of type '<UTMPose>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'linear_twist) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<UTMPose>)))
  "Returns string type for a message object of type '<UTMPose>"
  "mav_utils_msgs/UTMPose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'UTMPose)))
  "Returns string type for a message object of type 'UTMPose"
  "mav_utils_msgs/UTMPose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<UTMPose>)))
  "Returns md5sum for a message object of type '<UTMPose>"
  "b5f08bd7507ad9a363bb7722518a014f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'UTMPose)))
  "Returns md5sum for a message object of type 'UTMPose"
  "b5f08bd7507ad9a363bb7722518a014f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<UTMPose>)))
  "Returns full string definition for message of type '<UTMPose>"
  (cl:format cl:nil "std_msgs/Header header~%geometry_msgs/Pose pose~%geometry_msgs/Vector3 linear_twist~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'UTMPose)))
  "Returns full string definition for message of type 'UTMPose"
  (cl:format cl:nil "std_msgs/Header header~%geometry_msgs/Pose pose~%geometry_msgs/Vector3 linear_twist~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <UTMPose>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'linear_twist))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <UTMPose>))
  "Converts a ROS message object to a list"
  (cl:list 'UTMPose
    (cl:cons ':header (header msg))
    (cl:cons ':pose (pose msg))
    (cl:cons ':linear_twist (linear_twist msg))
))
