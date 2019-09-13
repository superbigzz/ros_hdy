
(cl:in-package :asdf)

(defsystem "visp_tracker-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :visp_tracker-msg
)
  :components ((:file "_package")
    (:file "Init" :depends-on ("_package_Init"))
    (:file "_package_Init" :depends-on ("_package"))
  ))