;; Auto-generated. Do not edit!


(when (boundp 'visp_camera_calibration::ImagePoint)
  (if (not (find-package "VISP_CAMERA_CALIBRATION"))
    (make-package "VISP_CAMERA_CALIBRATION"))
  (shadow 'ImagePoint (find-package "VISP_CAMERA_CALIBRATION")))
(unless (find-package "VISP_CAMERA_CALIBRATION::IMAGEPOINT")
  (make-package "VISP_CAMERA_CALIBRATION::IMAGEPOINT"))

(in-package "ROS")
;;//! \htmlinclude ImagePoint.msg.html


(defclass visp_camera_calibration::ImagePoint
  :super ros::object
  :slots (_x _y ))

(defmethod visp_camera_calibration::ImagePoint
  (:init
   (&key
    ((:x __x) 0)
    ((:y __y) 0)
    )
   (send-super :init)
   (setq _x (round __x))
   (setq _y (round __y))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:serialization-length
   ()
   (+
    ;; int32 _x
    4
    ;; int32 _y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _x
       (write-long _x s)
     ;; int32 _y
       (write-long _y s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _x
     (setq _x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _y
     (setq _y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get visp_camera_calibration::ImagePoint :md5sum-) "bd7b43fd41d4c47bf5c703cc7d016709")
(setf (get visp_camera_calibration::ImagePoint :datatype-) "visp_camera_calibration/ImagePoint")
(setf (get visp_camera_calibration::ImagePoint :definition-)
      "# a point (pixel coordinates) selected in an image

int32 x
int32 y

")



(provide :visp_camera_calibration/ImagePoint "bd7b43fd41d4c47bf5c703cc7d016709")


