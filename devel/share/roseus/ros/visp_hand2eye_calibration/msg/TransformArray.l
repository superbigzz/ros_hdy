;; Auto-generated. Do not edit!


(when (boundp 'visp_hand2eye_calibration::TransformArray)
  (if (not (find-package "VISP_HAND2EYE_CALIBRATION"))
    (make-package "VISP_HAND2EYE_CALIBRATION"))
  (shadow 'TransformArray (find-package "VISP_HAND2EYE_CALIBRATION")))
(unless (find-package "VISP_HAND2EYE_CALIBRATION::TRANSFORMARRAY")
  (make-package "VISP_HAND2EYE_CALIBRATION::TRANSFORMARRAY"))

(in-package "ROS")
;;//! \htmlinclude TransformArray.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass visp_hand2eye_calibration::TransformArray
  :super ros::object
  :slots (_header _transforms ))

(defmethod visp_hand2eye_calibration::TransformArray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:transforms __transforms) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Transform :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _transforms __transforms)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:transforms
   (&rest __transforms)
   (if (keywordp (car __transforms))
       (send* _transforms __transforms)
     (progn
       (if __transforms (setq _transforms (car __transforms)))
       _transforms)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Transform[] _transforms
    (apply #'+ (send-all _transforms :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Transform[] _transforms
     (write-long (length _transforms) s)
     (dolist (elem _transforms)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Transform[] _transforms
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _transforms (let (r) (dotimes (i n) (push (instance geometry_msgs::Transform :init) r)) r))
     (dolist (elem- _transforms)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get visp_hand2eye_calibration::TransformArray :md5sum-) "69339633e969be70367b6ff0fe206328")
(setf (get visp_hand2eye_calibration::TransformArray :datatype-) "visp_hand2eye_calibration/TransformArray")
(setf (get visp_hand2eye_calibration::TransformArray :definition-)
      "# An array of transforms with a header for global reference.

Header header

geometry_msgs/Transform[] transforms
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: geometry_msgs/Transform
# This represents the transform between two coordinate frames in free space.

Vector3 translation
Quaternion rotation

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :visp_hand2eye_calibration/TransformArray "69339633e969be70367b6ff0fe206328")


