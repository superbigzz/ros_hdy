;; Auto-generated. Do not edit!


(when (boundp 'visp_tracker::Init)
  (if (not (find-package "VISP_TRACKER"))
    (make-package "VISP_TRACKER"))
  (shadow 'Init (find-package "VISP_TRACKER")))
(unless (find-package "VISP_TRACKER::INIT")
  (make-package "VISP_TRACKER::INIT"))
(unless (find-package "VISP_TRACKER::INITREQUEST")
  (make-package "VISP_TRACKER::INITREQUEST"))
(unless (find-package "VISP_TRACKER::INITRESPONSE")
  (make-package "VISP_TRACKER::INITRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass visp_tracker::InitRequest
  :super ros::object
  :slots (_initial_cMo _tracker_param _moving_edge _klt_param ))

(defmethod visp_tracker::InitRequest
  (:init
   (&key
    ((:initial_cMo __initial_cMo) (instance geometry_msgs::Transform :init))
    ((:tracker_param __tracker_param) (instance visp_tracker::TrackerSettings :init))
    ((:moving_edge __moving_edge) (instance visp_tracker::MovingEdgeSettings :init))
    ((:klt_param __klt_param) (instance visp_tracker::KltSettings :init))
    )
   (send-super :init)
   (setq _initial_cMo __initial_cMo)
   (setq _tracker_param __tracker_param)
   (setq _moving_edge __moving_edge)
   (setq _klt_param __klt_param)
   self)
  (:initial_cMo
   (&rest __initial_cMo)
   (if (keywordp (car __initial_cMo))
       (send* _initial_cMo __initial_cMo)
     (progn
       (if __initial_cMo (setq _initial_cMo (car __initial_cMo)))
       _initial_cMo)))
  (:tracker_param
   (&rest __tracker_param)
   (if (keywordp (car __tracker_param))
       (send* _tracker_param __tracker_param)
     (progn
       (if __tracker_param (setq _tracker_param (car __tracker_param)))
       _tracker_param)))
  (:moving_edge
   (&rest __moving_edge)
   (if (keywordp (car __moving_edge))
       (send* _moving_edge __moving_edge)
     (progn
       (if __moving_edge (setq _moving_edge (car __moving_edge)))
       _moving_edge)))
  (:klt_param
   (&rest __klt_param)
   (if (keywordp (car __klt_param))
       (send* _klt_param __klt_param)
     (progn
       (if __klt_param (setq _klt_param (car __klt_param)))
       _klt_param)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Transform _initial_cMo
    (send _initial_cMo :serialization-length)
    ;; visp_tracker/TrackerSettings _tracker_param
    (send _tracker_param :serialization-length)
    ;; visp_tracker/MovingEdgeSettings _moving_edge
    (send _moving_edge :serialization-length)
    ;; visp_tracker/KltSettings _klt_param
    (send _klt_param :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Transform _initial_cMo
       (send _initial_cMo :serialize s)
     ;; visp_tracker/TrackerSettings _tracker_param
       (send _tracker_param :serialize s)
     ;; visp_tracker/MovingEdgeSettings _moving_edge
       (send _moving_edge :serialize s)
     ;; visp_tracker/KltSettings _klt_param
       (send _klt_param :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Transform _initial_cMo
     (send _initial_cMo :deserialize buf ptr-) (incf ptr- (send _initial_cMo :serialization-length))
   ;; visp_tracker/TrackerSettings _tracker_param
     (send _tracker_param :deserialize buf ptr-) (incf ptr- (send _tracker_param :serialization-length))
   ;; visp_tracker/MovingEdgeSettings _moving_edge
     (send _moving_edge :deserialize buf ptr-) (incf ptr- (send _moving_edge :serialization-length))
   ;; visp_tracker/KltSettings _klt_param
     (send _klt_param :deserialize buf ptr-) (incf ptr- (send _klt_param :serialization-length))
   ;;
   self)
  )

(defclass visp_tracker::InitResponse
  :super ros::object
  :slots (_initialization_succeed ))

(defmethod visp_tracker::InitResponse
  (:init
   (&key
    ((:initialization_succeed __initialization_succeed) nil)
    )
   (send-super :init)
   (setq _initialization_succeed __initialization_succeed)
   self)
  (:initialization_succeed
   (&optional __initialization_succeed)
   (if __initialization_succeed (setq _initialization_succeed __initialization_succeed)) _initialization_succeed)
  (:serialization-length
   ()
   (+
    ;; bool _initialization_succeed
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _initialization_succeed
       (if _initialization_succeed (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _initialization_succeed
     (setq _initialization_succeed (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass visp_tracker::Init
  :super ros::object
  :slots ())

(setf (get visp_tracker::Init :md5sum-) "99679e33547ba56c949bb75d2a309602")
(setf (get visp_tracker::Init :datatype-) "visp_tracker/Init")
(setf (get visp_tracker::Init :request) visp_tracker::InitRequest)
(setf (get visp_tracker::Init :response) visp_tracker::InitResponse)

(defmethod visp_tracker::InitRequest
  (:response () (instance visp_tracker::InitResponse :init)))

(setf (get visp_tracker::InitRequest :md5sum-) "99679e33547ba56c949bb75d2a309602")
(setf (get visp_tracker::InitRequest :datatype-) "visp_tracker/InitRequest")
(setf (get visp_tracker::InitRequest :definition-)
      "








geometry_msgs/Transform initial_cMo


TrackerSettings tracker_param


MovingEdgeSettings moving_edge


KltSettings klt_param

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

================================================================================
MSG: visp_tracker/TrackerSettings
# This message contains tracking parameters.
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


================================================================================
MSG: visp_tracker/MovingEdgeSettings
# This message contains tracking parameters.
#
# These parameters determine how precise, how fast and how
# reliable will be the tracking.
#
# It should be tuned carefully and can be changed dynamically.
#
# For more details, see the ViSP documentation:
# http://www.irisa.fr/lagadic/visp/publication.html


# Moving edge parameters.

int64 mask_size    # Mask size (in pixel) used to compute the image gradient
                   # and determine the object contour.
		   # A larger mask size is better for larger images.
		   # 3 pixels is enough for 640x480 images.
                   # Increasing this value makes the tracking slower.
		   #
		   # Caution: this value cannot be changed dynamically
		   # without resetting the tracking.

int64 range        # Maximum seek distance on both sides of the reference pixel.
      		   # It should match the maximum distance in pixel between
		   # the current position of the feature projection and
		   # its next position.
		   # I.e. if the object moves fast and your tracking
		   # frequency is low, this value should be increased.
                   # Increasing this value makes the tracking slower.

float64 threshold  # Value used to determine if a moving edge is valid
		   # or not.

float64 mu1        # Minimum image contrast allowed to detect a contour.
float64 mu2        # Maximum image contrast allowed to detect a contour.

int64 sample_step   # Minimum distance in pixel between two
      		    # discretization points.
      		    # It avoids having too many discretization points when
		    # the tracked object is far away (and its projection
		    # in the image is small).
		    # Increasing this value makes the tracking *faster*.

int64 strip             # How many pixels are ignored around the borders.


# Tracker parameters.

float64 first_threshold # What proportion of points should be valid to
                        # acccept an initial pose.
			# Value should be between 0 et 1.


================================================================================
MSG: visp_tracker/KltSettings
# This message contains tracking parameters.
#
# These parameters determine how precise, how fast and how
# reliable will be the tracking.
#
# It should be tuned carefully and can be changed dynamically.
#
# For more details, see the ViSP documentation:
# http://www.irisa.fr/lagadic/visp/publication.html

# Klt Parameters.

int64 max_features      # Maximum number of features
int64 window_size       # Window size
float64 quality         # Quality of the tracker
float64 min_distance      # Minimum distance betwenn two points
float64 harris          # Harris free parameters
int64 size_block        # Block size
int64 pyramid_lvl       # Pyramid levels
int64 mask_border       # Mask Border

---

bool initialization_succeed

")

(setf (get visp_tracker::InitResponse :md5sum-) "99679e33547ba56c949bb75d2a309602")
(setf (get visp_tracker::InitResponse :datatype-) "visp_tracker/InitResponse")
(setf (get visp_tracker::InitResponse :definition-)
      "








geometry_msgs/Transform initial_cMo


TrackerSettings tracker_param


MovingEdgeSettings moving_edge


KltSettings klt_param

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

================================================================================
MSG: visp_tracker/TrackerSettings
# This message contains tracking parameters.
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


================================================================================
MSG: visp_tracker/MovingEdgeSettings
# This message contains tracking parameters.
#
# These parameters determine how precise, how fast and how
# reliable will be the tracking.
#
# It should be tuned carefully and can be changed dynamically.
#
# For more details, see the ViSP documentation:
# http://www.irisa.fr/lagadic/visp/publication.html


# Moving edge parameters.

int64 mask_size    # Mask size (in pixel) used to compute the image gradient
                   # and determine the object contour.
		   # A larger mask size is better for larger images.
		   # 3 pixels is enough for 640x480 images.
                   # Increasing this value makes the tracking slower.
		   #
		   # Caution: this value cannot be changed dynamically
		   # without resetting the tracking.

int64 range        # Maximum seek distance on both sides of the reference pixel.
      		   # It should match the maximum distance in pixel between
		   # the current position of the feature projection and
		   # its next position.
		   # I.e. if the object moves fast and your tracking
		   # frequency is low, this value should be increased.
                   # Increasing this value makes the tracking slower.

float64 threshold  # Value used to determine if a moving edge is valid
		   # or not.

float64 mu1        # Minimum image contrast allowed to detect a contour.
float64 mu2        # Maximum image contrast allowed to detect a contour.

int64 sample_step   # Minimum distance in pixel between two
      		    # discretization points.
      		    # It avoids having too many discretization points when
		    # the tracked object is far away (and its projection
		    # in the image is small).
		    # Increasing this value makes the tracking *faster*.

int64 strip             # How many pixels are ignored around the borders.


# Tracker parameters.

float64 first_threshold # What proportion of points should be valid to
                        # acccept an initial pose.
			# Value should be between 0 et 1.


================================================================================
MSG: visp_tracker/KltSettings
# This message contains tracking parameters.
#
# These parameters determine how precise, how fast and how
# reliable will be the tracking.
#
# It should be tuned carefully and can be changed dynamically.
#
# For more details, see the ViSP documentation:
# http://www.irisa.fr/lagadic/visp/publication.html

# Klt Parameters.

int64 max_features      # Maximum number of features
int64 window_size       # Window size
float64 quality         # Quality of the tracker
float64 min_distance      # Minimum distance betwenn two points
float64 harris          # Harris free parameters
int64 size_block        # Block size
int64 pyramid_lvl       # Pyramid levels
int64 mask_border       # Mask Border

---

bool initialization_succeed

")



(provide :visp_tracker/Init "99679e33547ba56c949bb75d2a309602")


