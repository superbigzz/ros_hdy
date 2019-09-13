;; Auto-generated. Do not edit!


(when (boundp 'visp_camera_calibration::CalibPoint)
  (if (not (find-package "VISP_CAMERA_CALIBRATION"))
    (make-package "VISP_CAMERA_CALIBRATION"))
  (shadow 'CalibPoint (find-package "VISP_CAMERA_CALIBRATION")))
(unless (find-package "VISP_CAMERA_CALIBRATION::CALIBPOINT")
  (make-package "VISP_CAMERA_CALIBRATION::CALIBPOINT"))

(in-package "ROS")
;;//! \htmlinclude CalibPoint.msg.html


(defclass visp_camera_calibration::CalibPoint
  :super ros::object
  :slots (_i _j _X _Y _Z ))

(defmethod visp_camera_calibration::CalibPoint
  (:init
   (&key
    ((:i __i) 0)
    ((:j __j) 0)
    ((:X __X) 0.0)
    ((:Y __Y) 0.0)
    ((:Z __Z) 0.0)
    )
   (send-super :init)
   (setq _i (round __i))
   (setq _j (round __j))
   (setq _X (float __X))
   (setq _Y (float __Y))
   (setq _Z (float __Z))
   self)
  (:i
   (&optional __i)
   (if __i (setq _i __i)) _i)
  (:j
   (&optional __j)
   (if __j (setq _j __j)) _j)
  (:X
   (&optional __X)
   (if __X (setq _X __X)) _X)
  (:Y
   (&optional __Y)
   (if __Y (setq _Y __Y)) _Y)
  (:Z
   (&optional __Z)
   (if __Z (setq _Z __Z)) _Z)
  (:serialization-length
   ()
   (+
    ;; int32 _i
    4
    ;; int32 _j
    4
    ;; float64 _X
    8
    ;; float64 _Y
    8
    ;; float64 _Z
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _i
       (write-long _i s)
     ;; int32 _j
       (write-long _j s)
     ;; float64 _X
       (sys::poke _X (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Y
       (sys::poke _Y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Z
       (sys::poke _Z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _i
     (setq _i (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _j
     (setq _j (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _X
     (setq _X (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Y
     (setq _Y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Z
     (setq _Z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get visp_camera_calibration::CalibPoint :md5sum-) "9b9d41ff2127a593c07cec2a11858ac5")
(setf (get visp_camera_calibration::CalibPoint :datatype-) "visp_camera_calibration/CalibPoint")
(setf (get visp_camera_calibration::CalibPoint :definition-)
      "# a vpPoint

int32 i
int32 j
float64 X
float64 Y
float64 Z


")



(provide :visp_camera_calibration/CalibPoint "9b9d41ff2127a593c07cec2a11858ac5")


