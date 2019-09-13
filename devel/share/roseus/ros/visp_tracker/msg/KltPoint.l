;; Auto-generated. Do not edit!


(when (boundp 'visp_tracker::KltPoint)
  (if (not (find-package "VISP_TRACKER"))
    (make-package "VISP_TRACKER"))
  (shadow 'KltPoint (find-package "VISP_TRACKER")))
(unless (find-package "VISP_TRACKER::KLTPOINT")
  (make-package "VISP_TRACKER::KLTPOINT"))

(in-package "ROS")
;;//! \htmlinclude KltPoint.msg.html


(defclass visp_tracker::KltPoint
  :super ros::object
  :slots (_i _j _id ))

(defmethod visp_tracker::KltPoint
  (:init
   (&key
    ((:i __i) 0.0)
    ((:j __j) 0.0)
    ((:id __id) 0)
    )
   (send-super :init)
   (setq _i (float __i))
   (setq _j (float __j))
   (setq _id (round __id))
   self)
  (:i
   (&optional __i)
   (if __i (setq _i __i)) _i)
  (:j
   (&optional __j)
   (if __j (setq _j __j)) _j)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:serialization-length
   ()
   (+
    ;; float64 _i
    8
    ;; float64 _j
    8
    ;; int32 _id
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _i
       (sys::poke _i (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _j
       (sys::poke _j (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int32 _id
       (write-long _id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _i
     (setq _i (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _j
     (setq _j (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get visp_tracker::KltPoint :md5sum-) "6014cf727908e3e35d0048962e94796f")
(setf (get visp_tracker::KltPoint :datatype-) "visp_tracker/KltPoint")
(setf (get visp_tracker::KltPoint :definition-)
      "# KLT point position.

float64 i      # i position in the image
float64 j      # j position in the image
int32   id     # Point id

")



(provide :visp_tracker/KltPoint "6014cf727908e3e35d0048962e94796f")


