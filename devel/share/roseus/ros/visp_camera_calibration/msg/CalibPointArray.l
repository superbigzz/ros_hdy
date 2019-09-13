;; Auto-generated. Do not edit!


(when (boundp 'visp_camera_calibration::CalibPointArray)
  (if (not (find-package "VISP_CAMERA_CALIBRATION"))
    (make-package "VISP_CAMERA_CALIBRATION"))
  (shadow 'CalibPointArray (find-package "VISP_CAMERA_CALIBRATION")))
(unless (find-package "VISP_CAMERA_CALIBRATION::CALIBPOINTARRAY")
  (make-package "VISP_CAMERA_CALIBRATION::CALIBPOINTARRAY"))

(in-package "ROS")
;;//! \htmlinclude CalibPointArray.msg.html


(defclass visp_camera_calibration::CalibPointArray
  :super ros::object
  :slots (_points ))

(defmethod visp_camera_calibration::CalibPointArray
  (:init
   (&key
    ((:points __points) (let (r) (dotimes (i 0) (push (instance visp_camera_calibration::CalibPoint :init) r)) r))
    )
   (send-super :init)
   (setq _points __points)
   self)
  (:points
   (&rest __points)
   (if (keywordp (car __points))
       (send* _points __points)
     (progn
       (if __points (setq _points (car __points)))
       _points)))
  (:serialization-length
   ()
   (+
    ;; visp_camera_calibration/CalibPoint[] _points
    (apply #'+ (send-all _points :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; visp_camera_calibration/CalibPoint[] _points
     (write-long (length _points) s)
     (dolist (elem _points)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; visp_camera_calibration/CalibPoint[] _points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _points (let (r) (dotimes (i n) (push (instance visp_camera_calibration::CalibPoint :init) r)) r))
     (dolist (elem- _points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get visp_camera_calibration::CalibPointArray :md5sum-) "46e7b53381d96d2d7cbbb7418f6dd696")
(setf (get visp_camera_calibration::CalibPointArray :datatype-) "visp_camera_calibration/CalibPointArray")
(setf (get visp_camera_calibration::CalibPointArray :definition-)
      "# an array of vpPoint
visp_camera_calibration/CalibPoint[] points

================================================================================
MSG: visp_camera_calibration/CalibPoint
# a vpPoint

int32 i
int32 j
float64 X
float64 Y
float64 Z


")



(provide :visp_camera_calibration/CalibPointArray "46e7b53381d96d2d7cbbb7418f6dd696")


