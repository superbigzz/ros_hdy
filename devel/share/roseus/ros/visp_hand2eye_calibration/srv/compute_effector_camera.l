;; Auto-generated. Do not edit!


(when (boundp 'visp_hand2eye_calibration::compute_effector_camera)
  (if (not (find-package "VISP_HAND2EYE_CALIBRATION"))
    (make-package "VISP_HAND2EYE_CALIBRATION"))
  (shadow 'compute_effector_camera (find-package "VISP_HAND2EYE_CALIBRATION")))
(unless (find-package "VISP_HAND2EYE_CALIBRATION::COMPUTE_EFFECTOR_CAMERA")
  (make-package "VISP_HAND2EYE_CALIBRATION::COMPUTE_EFFECTOR_CAMERA"))
(unless (find-package "VISP_HAND2EYE_CALIBRATION::COMPUTE_EFFECTOR_CAMERAREQUEST")
  (make-package "VISP_HAND2EYE_CALIBRATION::COMPUTE_EFFECTOR_CAMERAREQUEST"))
(unless (find-package "VISP_HAND2EYE_CALIBRATION::COMPUTE_EFFECTOR_CAMERARESPONSE")
  (make-package "VISP_HAND2EYE_CALIBRATION::COMPUTE_EFFECTOR_CAMERARESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass visp_hand2eye_calibration::compute_effector_cameraRequest
  :super ros::object
  :slots ())

(defmethod visp_hand2eye_calibration::compute_effector_cameraRequest
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

(defclass visp_hand2eye_calibration::compute_effector_cameraResponse
  :super ros::object
  :slots (_effector_camera ))

(defmethod visp_hand2eye_calibration::compute_effector_cameraResponse
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

(defclass visp_hand2eye_calibration::compute_effector_camera
  :super ros::object
  :slots ())

(setf (get visp_hand2eye_calibration::compute_effector_camera :md5sum-) "e28a9ea34e6e135a6309cbdf6fb0ad0d")
(setf (get visp_hand2eye_calibration::compute_effector_camera :datatype-) "visp_hand2eye_calibration/compute_effector_camera")
(setf (get visp_hand2eye_calibration::compute_effector_camera :request) visp_hand2eye_calibration::compute_effector_cameraRequest)
(setf (get visp_hand2eye_calibration::compute_effector_camera :response) visp_hand2eye_calibration::compute_effector_cameraResponse)

(defmethod visp_hand2eye_calibration::compute_effector_cameraRequest
  (:response () (instance visp_hand2eye_calibration::compute_effector_cameraResponse :init)))

(setf (get visp_hand2eye_calibration::compute_effector_cameraRequest :md5sum-) "e28a9ea34e6e135a6309cbdf6fb0ad0d")
(setf (get visp_hand2eye_calibration::compute_effector_cameraRequest :datatype-) "visp_hand2eye_calibration/compute_effector_cameraRequest")
(setf (get visp_hand2eye_calibration::compute_effector_cameraRequest :definition-)
      "



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

(setf (get visp_hand2eye_calibration::compute_effector_cameraResponse :md5sum-) "e28a9ea34e6e135a6309cbdf6fb0ad0d")
(setf (get visp_hand2eye_calibration::compute_effector_cameraResponse :datatype-) "visp_hand2eye_calibration/compute_effector_cameraResponse")
(setf (get visp_hand2eye_calibration::compute_effector_cameraResponse :definition-)
      "



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



(provide :visp_hand2eye_calibration/compute_effector_camera "e28a9ea34e6e135a6309cbdf6fb0ad0d")


