
(cl:in-package :asdf)

(defsystem "visp_tracker-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "KltPoint" :depends-on ("_package_KltPoint"))
    (:file "_package_KltPoint" :depends-on ("_package"))
    (:file "KltPoints" :depends-on ("_package_KltPoints"))
    (:file "_package_KltPoints" :depends-on ("_package"))
    (:file "KltSettings" :depends-on ("_package_KltSettings"))
    (:file "_package_KltSettings" :depends-on ("_package"))
    (:file "MovingEdgeSettings" :depends-on ("_package_MovingEdgeSettings"))
    (:file "_package_MovingEdgeSettings" :depends-on ("_package"))
    (:file "MovingEdgeSite" :depends-on ("_package_MovingEdgeSite"))
    (:file "_package_MovingEdgeSite" :depends-on ("_package"))
    (:file "MovingEdgeSites" :depends-on ("_package_MovingEdgeSites"))
    (:file "_package_MovingEdgeSites" :depends-on ("_package"))
    (:file "TrackerSettings" :depends-on ("_package_TrackerSettings"))
    (:file "_package_TrackerSettings" :depends-on ("_package"))
  ))