
(cl:in-package :asdf)

(defsystem "visp_camera_calibration-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "CalibPoint" :depends-on ("_package_CalibPoint"))
    (:file "_package_CalibPoint" :depends-on ("_package"))
    (:file "CalibPointArray" :depends-on ("_package_CalibPointArray"))
    (:file "_package_CalibPointArray" :depends-on ("_package"))
    (:file "ImageAndPoints" :depends-on ("_package_ImageAndPoints"))
    (:file "_package_ImageAndPoints" :depends-on ("_package"))
    (:file "ImagePoint" :depends-on ("_package_ImagePoint"))
    (:file "_package_ImagePoint" :depends-on ("_package"))
  ))