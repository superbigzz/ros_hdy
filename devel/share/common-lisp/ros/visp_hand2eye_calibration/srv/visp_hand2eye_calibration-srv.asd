
(cl:in-package :asdf)

(defsystem "visp_hand2eye_calibration-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :visp_hand2eye_calibration-msg
)
  :components ((:file "_package")
    (:file "compute_effector_camera" :depends-on ("_package_compute_effector_camera"))
    (:file "_package_compute_effector_camera" :depends-on ("_package"))
    (:file "compute_effector_camera_quick" :depends-on ("_package_compute_effector_camera_quick"))
    (:file "_package_compute_effector_camera_quick" :depends-on ("_package"))
    (:file "reset" :depends-on ("_package_reset"))
    (:file "_package_reset" :depends-on ("_package"))
  ))