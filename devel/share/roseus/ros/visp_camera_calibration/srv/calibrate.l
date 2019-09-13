;; Auto-generated. Do not edit!


(when (boundp 'visp_camera_calibration::calibrate)
  (if (not (find-package "VISP_CAMERA_CALIBRATION"))
    (make-package "VISP_CAMERA_CALIBRATION"))
  (shadow 'calibrate (find-package "VISP_CAMERA_CALIBRATION")))
(unless (find-package "VISP_CAMERA_CALIBRATION::CALIBRATE")
  (make-package "VISP_CAMERA_CALIBRATION::CALIBRATE"))
(unless (find-package "VISP_CAMERA_CALIBRATION::CALIBRATEREQUEST")
  (make-package "VISP_CAMERA_CALIBRATION::CALIBRATEREQUEST"))
(unless (find-package "VISP_CAMERA_CALIBRATION::CALIBRATERESPONSE")
  (make-package "VISP_CAMERA_CALIBRATION::CALIBRATERESPONSE"))

(in-package "ROS")





(defclass visp_camera_calibration::calibrateRequest
  :super ros::object
  :slots (_method _sample_width _sample_height ))

(defmethod visp_camera_calibration::calibrateRequest
  (:init
   (&key
    ((:method __method) 0)
    ((:sample_width __sample_width) 0)
    ((:sample_height __sample_height) 0)
    )
   (send-super :init)
   (setq _method (round __method))
   (setq _sample_width (round __sample_width))
   (setq _sample_height (round __sample_height))
   self)
  (:method
   (&optional __method)
   (if __method (setq _method __method)) _method)
  (:sample_width
   (&optional __sample_width)
   (if __sample_width (setq _sample_width __sample_width)) _sample_width)
  (:sample_height
   (&optional __sample_height)
   (if __sample_height (setq _sample_height __sample_height)) _sample_height)
  (:serialization-length
   ()
   (+
    ;; int32 _method
    4
    ;; int32 _sample_width
    4
    ;; int32 _sample_height
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _method
       (write-long _method s)
     ;; int32 _sample_width
       (write-long _sample_width s)
     ;; int32 _sample_height
       (write-long _sample_height s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _method
     (setq _method (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _sample_width
     (setq _sample_width (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _sample_height
     (setq _sample_height (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass visp_camera_calibration::calibrateResponse
  :super ros::object
  :slots (_stdDevErrs ))

(defmethod visp_camera_calibration::calibrateResponse
  (:init
   (&key
    ((:stdDevErrs __stdDevErrs) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _stdDevErrs __stdDevErrs)
   self)
  (:stdDevErrs
   (&optional __stdDevErrs)
   (if __stdDevErrs (setq _stdDevErrs __stdDevErrs)) _stdDevErrs)
  (:serialization-length
   ()
   (+
    ;; float64[] _stdDevErrs
    (* 8    (length _stdDevErrs)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _stdDevErrs
     (write-long (length _stdDevErrs) s)
     (dotimes (i (length _stdDevErrs))
       (sys::poke (elt _stdDevErrs i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _stdDevErrs
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _stdDevErrs (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _stdDevErrs i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(defclass visp_camera_calibration::calibrate
  :super ros::object
  :slots ())

(setf (get visp_camera_calibration::calibrate :md5sum-) "30e17d7747033ddb69c9980395e78d44")
(setf (get visp_camera_calibration::calibrate :datatype-) "visp_camera_calibration/calibrate")
(setf (get visp_camera_calibration::calibrate :request) visp_camera_calibration::calibrateRequest)
(setf (get visp_camera_calibration::calibrate :response) visp_camera_calibration::calibrateResponse)

(defmethod visp_camera_calibration::calibrateRequest
  (:response () (instance visp_camera_calibration::calibrateResponse :init)))

(setf (get visp_camera_calibration::calibrateRequest :md5sum-) "30e17d7747033ddb69c9980395e78d44")
(setf (get visp_camera_calibration::calibrateRequest :datatype-) "visp_camera_calibration/calibrateRequest")
(setf (get visp_camera_calibration::calibrateRequest :definition-)
      "int32 method
int32 sample_width
int32 sample_height
---
float64[] stdDevErrs

")

(setf (get visp_camera_calibration::calibrateResponse :md5sum-) "30e17d7747033ddb69c9980395e78d44")
(setf (get visp_camera_calibration::calibrateResponse :datatype-) "visp_camera_calibration/calibrateResponse")
(setf (get visp_camera_calibration::calibrateResponse :definition-)
      "int32 method
int32 sample_width
int32 sample_height
---
float64[] stdDevErrs

")



(provide :visp_camera_calibration/calibrate "30e17d7747033ddb69c9980395e78d44")


