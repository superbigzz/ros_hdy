;; Auto-generated. Do not edit!


(when (boundp 'visp_hand2eye_calibration::compute_effector_camera_quick)
  (if (not (find-package "VISP_HAND2EYE_CALIBRATION"))
    (make-package "VISP_HAND2EYE_CALIBRATION"))
  (shadow 'compute_effector_camera_quick (find-package "VISP_HAND2EYE_CALIBRATION")))
(unless (find-package "VISP_HAND2EYE_CALIBRATION::COMPUTE_EFFECTOR_CAMERA_QUICK")
  (make-package "VISP_HAND2EYE_CALIBRATION::COMPUTE_EFFECTOR_CAMERA_QUICK"))
(unless (find-package "VISP_HAND2EYE_CALIBRATION::COMPUTE_EFFECTOR_CAMERA_QUICKREQUEST")
  (make-package "VISP_HAND2EYE_CALIBRATION::COMPUTE_EFFECTOR_CAMERA_QUICKREQUEST"))
(unless (find-package "VISP_HAND2EYE_CALIBRATION::COMPUTE_EFFECTOR_CAMERA_QUICKRESPONSE")
  (make-package "VISP_HAND2EYE_CALIBRATION::COMPUTE_EFFECTOR_CAMERA_QUICKRESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass visp_hand2eye_calibration::compute_effector_camera_quickRequest
  :super ros::object
  :slots (_camera_object _world_effector ))

(defmethod visp_hand2eye_calibration::compute_effector_camera_quickRequest
  (:init
   (&key
    ((:camera_object __camera_object) (instance visp_hand2eye_calibration::TransformArray :init))
    ((:world_effector __world_effector) (instance visp_hand2eye_calibration::TransformArray :init))
    )
   (send-super :init)
   (setq _camera_object __camera_object)
   (setq _world_effector __world_effector)
   self)
  (:camera_object
   (&rest __camera_object)
   (if (keywordp (car __camera_object))
       (send* _camera_object __camera_object)
     (progn
       (if __camera_object (setq _camera_object (car __camera_object)))
       _camera_object)))
  (:world_effector
   (&rest __world_effector)
   (if (keywordp (car __world_effector))
       (send* _world_effector __world_effector)
     (progn
       (if __world_effector (setq _world_effector (car __world_effector)))
       _world_effector)))
  (:serialization-length
   ()
   (+
    ;; visp_hand2eye_calibration/TransformArray _camera_object
    (send _camera_object :serialization-length)
    ;; visp_hand2eye_calibration/TransformArray _world_effector
    (send _world_effector :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; visp_hand2eye_calibration/TransformArray _camera_object
       (send _camera_object :serialize s)
     ;; visp_hand2eye_calibration/TransformArray _world_effector
       (send _world_effector :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; visp_hand2eye_calibration/TransformArray _camera_object
     (send _camera_object :deserialize buf ptr-) (incf ptr- (send _camera_object :serialization-length))
   ;; visp_hand2eye_calibration/TransformArray _world_effector
     (send _world_effector :deserialize buf ptr-) (incf ptr- (send _world_effector :serialization-length))
   ;;
   self)
  )

(defclass visp_hand2eye_calibration::compute_effector_camera_quickResponse
  :super ros::object
  :slots (_effector_camera ))

(defmethod visp_hand2eye_calibration::compute_effector_camera_quickResponse
  (:init
   (&key
    ((:effector_camera __effector_camera) (instance geometry_msgs::Transform :init))
    )
   (send-super :init)
   (setq _effector_camera __effector_camera)
   self)
  (:effector_camera
   (&rest __effector_camera)
   (if (keywordp (car __effector_camera))
       (send* _effector_camera __effector_camera)
     (progn
       (if __effector_camera (setq _effector_camera (car __effector_camera)))
       _effector_camera)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Transform _effector_camera
    (send _effector_camera :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Transform _effector_camera
       (send _effector_camera :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Transform _effector_camera
     (send _effector_camera :deserialize buf ptr-) (incf ptr- (send _effector_camera :serialization-length))
   ;;
   self)
  )

(defclass visp_hand2eye_calibration::compute_effector_camera_quick
  :super ros::object
  :slots ())

(setf (get visp_hand2eye_calibration::compute_effector_camera_quick :md5sum-) "ac7e8b661c5bfedda75b54410a11cf73")
(setf (get visp_hand2eye_calibration::compute_effector_camera_quick :datatype-) "visp_hand2eye_calibration/compute_effector_camera_quick")
(setf (get visp_hand2eye_calibration::compute_effector_camera_quick :request) visp_hand2eye_calibration::compute_effector_camera_quickRequest)
(setf (get visp_hand2eye_calibration::compute_effector_camera_quick :response) visp_hand2eye_calibration::compute_effector_camera_quickResponse)

(defmethod visp_hand2eye_calibration::compute_effector_camera_quickRequest
  (:response () (instance visp_hand2eye_calibration::compute_effector_camera_quickResponse :init)))

(setf (get visp_hand2eye_calibration::compute_effector_camera_quickRequest :md5sum-) "ac7e8b661c5bfedda75b54410a11cf73")
(setf (get visp_hand2eye_calibration::compute_effector_camera_quickRequest :datatype-) "visp_hand2eye_calibration/compute_effector_camera_quickRequest")
(setf (get visp_hand2eye_calibration::compute_effector_camera_quickRequest :definition-)
      "


visp_hand2eye_calibration/TransformArray camera_object
visp_hand2eye_calibration/TransformArray world_effector

================================================================================
MSG: visp_hand2eye_calibration/TransformArray
# An array of transforms with a header for global reference.

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
---
geometry_msgs/Transform effector_camera

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

(setf (get visp_hand2eye_calibration::compute_effector_camera_quickResponse :md5sum-) "ac7e8b661c5bfedda75b54410a11cf73")
(setf (get visp_hand2eye_calibration::compute_effector_camera_quickResponse :datatype-) "visp_hand2eye_calibration/compute_effector_camera_quickResponse")
(setf (get visp_hand2eye_calibration::compute_effector_camera_quickResponse :definition-)
      "


visp_hand2eye_calibration/TransformArray camera_object
visp_hand2eye_calibration/TransformArray world_effector

================================================================================
MSG: visp_hand2eye_calibration/TransformArray
# An array of transforms with a header for global reference.

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
---
geometry_msgs/Transform effector_camera

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



(provide :visp_hand2eye_calibration/compute_effector_camera_quick "ac7e8b661c5bfedda75b54410a11cf73")


