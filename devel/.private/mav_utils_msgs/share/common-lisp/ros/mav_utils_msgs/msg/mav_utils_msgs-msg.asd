
(cl:in-package :asdf)

(defsystem "mav_utils_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "BBPose" :depends-on ("_package_BBPose"))
    (:file "_package_BBPose" :depends-on ("_package"))
    (:file "BBPoses" :depends-on ("_package_BBPoses"))
    (:file "_package_BBPoses" :depends-on ("_package"))
    (:file "BBox" :depends-on ("_package_BBox"))
    (:file "_package_BBox" :depends-on ("_package"))
    (:file "BBoxes" :depends-on ("_package_BBoxes"))
    (:file "_package_BBoxes" :depends-on ("_package"))
    (:file "RouterData" :depends-on ("_package_RouterData"))
    (:file "_package_RouterData" :depends-on ("_package"))
    (:file "RouterInfo" :depends-on ("_package_RouterInfo"))
    (:file "_package_RouterInfo" :depends-on ("_package"))
    (:file "TaskInfo" :depends-on ("_package_TaskInfo"))
    (:file "_package_TaskInfo" :depends-on ("_package"))
    (:file "UTMPose" :depends-on ("_package_UTMPose"))
    (:file "_package_UTMPose" :depends-on ("_package"))
  ))