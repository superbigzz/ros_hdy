;; Auto-generated. Do not edit!


(when (boundp 'visp_tracker::KltPoints)
  (if (not (find-package "VISP_TRACKER"))
    (make-package "VISP_TRACKER"))
  (shadow 'KltPoints (find-package "VISP_TRACKER")))
(unless (find-package "VISP_TRACKER::KLTPOINTS")
  (make-package "VISP_TRACKER::KLTPOINTS"))

(in-package "ROS")
;;//! \htmlinclude KltPoints.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass visp_tracker::KltPoints
  :super ros::object
  :slots (_header _klt_points_positions ))

(defmethod visp_tracker::KltPoints
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:klt_points_positions __klt_points_positions) (let (r) (dotimes (i 0) (push (instance visp_tracker::KltPoint :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _klt_points_positions __klt_points_positions)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:klt_points_positions
   (&rest __klt_points_positions)
   (if (keywordp (car __klt_points_positions))
       (send* _klt_points_positions __klt_points_positions)
     (progn
       (if __klt_points_positions (setq _klt_points_positions (car __klt_points_positions)))
       _klt_points_positions)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; visp_tracker/KltPoint[] _klt_points_positions
    (apply #'+ (send-all _klt_points_positions :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; visp_tracker/KltPoint[] _klt_points_positions
     (write-long (length _klt_points_positions) s)
     (dolist (elem _klt_points_positions)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; visp_tracker/KltPoint[] _klt_points_positions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _klt_points_positions (let (r) (dotimes (i n) (push (instance visp_tracker::KltPoint :init) r)) r))
     (dolist (elem- _klt_points_positions)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get visp_tracker::KltPoints :md5sum-) "681548d0f72044b7f086e3985d86f93c")
(setf (get visp_tracker::KltPoints :datatype-) "visp_tracker/KltPoints")
(setf (get visp_tracker::KltPoints :definition-)
      "# Stamped list of KLT points positions.
#
# KLT points positions associated with a particular timestamp.
# Used by the viewer to display KLT points positions and allow
# tracking debug.

Header header                        # Header (required for synchronization).
KltPoint[] klt_points_positions      # List of KLT points positions.

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
MSG: visp_tracker/KltPoint
# KLT point position.

float64 i      # i position in the image
float64 j      # j position in the image
int32   id     # Point id

")



(provide :visp_tracker/KltPoints "681548d0f72044b7f086e3985d86f93c")


