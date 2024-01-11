
(cl:in-package :asdf)

(defsystem "mav_planning_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :mav_planning_msgs-msg
               :trajectory_msgs-msg
)
  :components ((:file "_package")
    (:file "ChangeNameService" :depends-on ("_package_ChangeNameService"))
    (:file "_package_ChangeNameService" :depends-on ("_package"))
    (:file "PlannerService" :depends-on ("_package_PlannerService"))
    (:file "_package_PlannerService" :depends-on ("_package"))
    (:file "PolygonService" :depends-on ("_package_PolygonService"))
    (:file "_package_PolygonService" :depends-on ("_package"))
  ))