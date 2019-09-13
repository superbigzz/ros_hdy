;; Auto-generated. Do not edit!


(when (boundp 'visp_tracker::MovingEdgeSite)
  (if (not (find-package "VISP_TRACKER"))
    (make-package "VISP_TRACKER"))
  (shadow 'MovingEdgeSite (find-package "VISP_TRACKER")))
(unless (find-package "VISP_TRACKER::MOVINGEDGESITE")
  (make-package "VISP_TRACKER::MOVINGEDGESITE"))

(in-package "ROS")
;;//! \htmlinclude MovingEdgeSite.msg.html


(defclass visp_tracker::MovingEdgeSite
  :super ros::object
  :slots (_x _y _suppress ))

(defmethod visp_tracker::MovingEdgeSite
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:suppress __suppress) 0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _suppress (round __suppress))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:suppress
   (&optional __suppress)
   (if __suppress (setq _suppress __suppress)) _suppress)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; int32 _suppress
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int32 _suppress
       (write-long _suppress s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int32 _suppress
     (setq _suppress (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get visp_tracker::MovingEdgeSite :md5sum-) "d67448def98304944978d0ca12803af8")
(setf (get visp_tracker::MovingEdgeSite :datatype-) "visp_tracker/MovingEdgeSite")
(setf (get visp_tracker::MovingEdgeSite :definition-)
      "# Moving edge position.

float64 x      # X position in the image
float64 y      # Y position in the image
int32 suppress # Is the moving edge valid?
               # - 0:   yes
	       # - 1:   no, constrast check has failed.
	       # - 2:   no, threshold check has failed.
	       # - 3:   no, M-estimator check has failed.
	       # - >=4: no, undocumented reason.

")



(provide :visp_tracker/MovingEdgeSite "d67448def98304944978d0ca12803af8")


