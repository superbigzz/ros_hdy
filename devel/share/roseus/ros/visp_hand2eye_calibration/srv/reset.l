;; Auto-generated. Do not edit!


(when (boundp 'visp_hand2eye_calibration::reset)
  (if (not (find-package "VISP_HAND2EYE_CALIBRATION"))
    (make-package "VISP_HAND2EYE_CALIBRATION"))
  (shadow 'reset (find-package "VISP_HAND2EYE_CALIBRATION")))
(unless (find-package "VISP_HAND2EYE_CALIBRATION::RESET")
  (make-package "VISP_HAND2EYE_CALIBRATION::RESET"))
(unless (find-package "VISP_HAND2EYE_CALIBRATION::RESETREQUEST")
  (make-package "VISP_HAND2EYE_CALIBRATION::RESETREQUEST"))
(unless (find-package "VISP_HAND2EYE_CALIBRATION::RESETRESPONSE")
  (make-package "VISP_HAND2EYE_CALIBRATION::RESETRESPONSE"))

(in-package "ROS")





(defclass visp_hand2eye_calibration::resetRequest
  :super ros::object
  :slots ())

(defmethod visp_hand2eye_calibration::resetRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass visp_hand2eye_calibration::resetResponse
  :super ros::object
  :slots ())

(defmethod visp_hand2eye_calibration::resetResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass visp_hand2eye_calibration::reset
  :super ros::object
  :slots ())

(setf (get visp_hand2eye_calibration::reset :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get visp_hand2eye_calibration::reset :datatype-) "visp_hand2eye_calibration/reset")
(setf (get visp_hand2eye_calibration::reset :request) visp_hand2eye_calibration::resetRequest)
(setf (get visp_hand2eye_calibration::reset :response) visp_hand2eye_calibration::resetResponse)

(defmethod visp_hand2eye_calibration::resetRequest
  (:response () (instance visp_hand2eye_calibration::resetResponse :init)))

(setf (get visp_hand2eye_calibration::resetRequest :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get visp_hand2eye_calibration::resetRequest :datatype-) "visp_hand2eye_calibration/resetRequest")
(setf (get visp_hand2eye_calibration::resetRequest :definition-)
      "---

")

(setf (get visp_hand2eye_calibration::resetResponse :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get visp_hand2eye_calibration::resetResponse :datatype-) "visp_hand2eye_calibration/resetResponse")
(setf (get visp_hand2eye_calibration::resetResponse :definition-)
      "---

")



(provide :visp_hand2eye_calibration/reset "d41d8cd98f00b204e9800998ecf8427e")


