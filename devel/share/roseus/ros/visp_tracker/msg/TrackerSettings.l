;; Auto-generated. Do not edit!


(when (boundp 'visp_tracker::TrackerSettings)
  (if (not (find-package "VISP_TRACKER"))
    (make-package "VISP_TRACKER"))
  (shadow 'TrackerSettings (find-package "VISP_TRACKER")))
(unless (find-package "VISP_TRACKER::TRACKERSETTINGS")
  (make-package "VISP_TRACKER::TRACKERSETTINGS"))

(in-package "ROS")
;;//! \htmlinclude TrackerSettings.msg.html


(defclass visp_tracker::TrackerSettings
  :super ros::object
  :slots (_angle_appear _angle_disappear ))

(defmethod visp_tracker::TrackerSettings
  (:init
   (&key
    ((:angle_appear __angle_appear) 0.0)
    ((:angle_disappear __angle_disappear) 0.0)
    )
   (send-super :init)
   (setq _angle_appear (float __angle_appear))
   (setq _angle_disappear (float __angle_disappear))
   self)
  (:angle_appear
   (&optional __angle_appear)
   (if __angle_appear (setq _angle_appear __angle_appear)) _angle_appear)
  (:angle_disappear
   (&optional __angle_disappear)
   (if __angle_disappear (setq _angle_disappear __angle_disappear)) _angle_disappear)
  (:serialization-length
   ()
   (+
    ;; float64 _angle_appear
    8
    ;; float64 _angle_disappear
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _angle_appear
       (sys::poke _angle_appear (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angle_disappear
       (sys::poke _angle_disappear (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _angle_appear
     (setq _angle_appear (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angle_disappear
     (setq _angle_disappear (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get visp_tracker::TrackerSettings :md5sum-) "3af7f3dad594635cfe340be2c0b60a68")
(setf (get visp_tracker::TrackerSettings :datatype-) "visp_tracker/TrackerSettings")
(setf (get visp_tracker::TrackerSettings :definition-)
      "# This message contains tracking parameters.
#
# These parameters determine how precise, how fast and how
# reliable will be the tracking.
#
# It should be tuned carefully and can be changed dynamically.
#
# For more details, see the ViSP documentation:
# http://www.irisa.fr/lagadic/visp/publication.html

# Common Tracker Parameters.
float64 angle_appear    # Angle to test faces apparition
float64 angle_disappear # Angle to test faces disparition


")



(provide :visp_tracker/TrackerSettings "3af7f3dad594635cfe340be2c0b60a68")


