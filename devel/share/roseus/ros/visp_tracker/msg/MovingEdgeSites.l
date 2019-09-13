;; Auto-generated. Do not edit!


(when (boundp 'visp_tracker::MovingEdgeSites)
  (if (not (find-package "VISP_TRACKER"))
    (make-package "VISP_TRACKER"))
  (shadow 'MovingEdgeSites (find-package "VISP_TRACKER")))
(unless (find-package "VISP_TRACKER::MOVINGEDGESITES")
  (make-package "VISP_TRACKER::MOVINGEDGESITES"))

(in-package "ROS")
;;//! \htmlinclude MovingEdgeSites.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass visp_tracker::MovingEdgeSites
  :super ros::object
  :slots (_header _moving_edge_sites ))

(defmethod visp_tracker::MovingEdgeSites
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:moving_edge_sites __moving_edge_sites) (let (r) (dotimes (i 0) (push (instance visp_tracker::MovingEdgeSite :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _moving_edge_sites __moving_edge_sites)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:moving_edge_sites
   (&rest __moving_edge_sites)
   (if (keywordp (car __moving_edge_sites))
       (send* _moving_edge_sites __moving_edge_sites)
     (progn
       (if __moving_edge_sites (setq _moving_edge_sites (car __moving_edge_sites)))
       _moving_edge_sites)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; visp_tracker/MovingEdgeSite[] _moving_edge_sites
    (apply #'+ (send-all _moving_edge_sites :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; visp_tracker/MovingEdgeSite[] _moving_edge_sites
     (write-long (length _moving_edge_sites) s)
     (dolist (elem _moving_edge_sites)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; visp_tracker/MovingEdgeSite[] _moving_edge_sites
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _moving_edge_sites (let (r) (dotimes (i n) (push (instance visp_tracker::MovingEdgeSite :init) r)) r))
     (dolist (elem- _moving_edge_sites)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get visp_tracker::MovingEdgeSites :md5sum-) "5293e8601467590a0dabbb34da47310c")
(setf (get visp_tracker::MovingEdgeSites :datatype-) "visp_tracker/MovingEdgeSites")
(setf (get visp_tracker::MovingEdgeSites :definition-)
      "# Stamped list of moving edge positions.
#
# Moving edge positions associated with a particular timestamp.
# Used by the viewer to display moving edge positions and allow
# tracking debug.

Header header                       # Header (required for synchronization).
MovingEdgeSite[] moving_edge_sites  # List of moving dge sites (i.e. positions).

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
MSG: visp_tracker/MovingEdgeSite
# Moving edge position.

float64 x      # X position in the image
float64 y      # Y position in the image
int32 suppress # Is the moving edge valid?
               # - 0:   yes
	       # - 1:   no, constrast check has failed.
	       # - 2:   no, threshold check has failed.
	       # - 3:   no, M-estimator check has failed.
	       # - >=4: no, undocumented reason.

")



(provide :visp_tracker/MovingEdgeSites "5293e8601467590a0dabbb34da47310c")


