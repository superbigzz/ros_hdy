; Auto-generated. Do not edit!


(cl:in-package visp_tracker-msg)


;//! \htmlinclude MovingEdgeSites.msg.html

(cl:defclass <MovingEdgeSites> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (moving_edge_sites
    :reader moving_edge_sites
    :initarg :moving_edge_sites
    :type (cl:vector visp_tracker-msg:MovingEdgeSite)
   :initform (cl:make-array 0 :element-type 'visp_tracker-msg:MovingEdgeSite :initial-element (cl:make-instance 'visp_tracker-msg:MovingEdgeSite))))
)

(cl:defclass MovingEdgeSites (<MovingEdgeSites>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MovingEdgeSites>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MovingEdgeSites)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name visp_tracker-msg:<MovingEdgeSites> is deprecated: use visp_tracker-msg:MovingEdgeSites instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MovingEdgeSites>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:header-val is deprecated.  Use visp_tracker-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'moving_edge_sites-val :lambda-list '(m))
(cl:defmethod moving_edge_sites-val ((m <MovingEdgeSites>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:moving_edge_sites-val is deprecated.  Use visp_tracker-msg:moving_edge_sites instead.")
  (moving_edge_sites m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MovingEdgeSites>) ostream)
  "Serializes a message object of type '<MovingEdgeSites>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'moving_edge_sites))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'moving_edge_sites))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MovingEdgeSites>) istream)
  "Deserializes a message object of type '<MovingEdgeSites>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'moving_edge_sites) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'moving_edge_sites)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'visp_tracker-msg:MovingEdgeSite))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MovingEdgeSites>)))
  "Returns string type for a message object of type '<MovingEdgeSites>"
  "visp_tracker/MovingEdgeSites")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovingEdgeSites)))
  "Returns string type for a message object of type 'MovingEdgeSites"
  "visp_tracker/MovingEdgeSites")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MovingEdgeSites>)))
  "Returns md5sum for a message object of type '<MovingEdgeSites>"
  "5293e8601467590a0dabbb34da47310c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MovingEdgeSites)))
  "Returns md5sum for a message object of type 'MovingEdgeSites"
  "5293e8601467590a0dabbb34da47310c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MovingEdgeSites>)))
  "Returns full string definition for message of type '<MovingEdgeSites>"
  (cl:format cl:nil "# Stamped list of moving edge positions.~%#~%# Moving edge positions associated with a particular timestamp.~%# Used by the viewer to display moving edge positions and allow~%# tracking debug.~%~%Header header                       # Header (required for synchronization).~%MovingEdgeSite[] moving_edge_sites  # List of moving dge sites (i.e. positions).~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: visp_tracker/MovingEdgeSite~%# Moving edge position.~%~%float64 x      # X position in the image~%float64 y      # Y position in the image~%int32 suppress # Is the moving edge valid?~%               # - 0:   yes~%	       # - 1:   no, constrast check has failed.~%	       # - 2:   no, threshold check has failed.~%	       # - 3:   no, M-estimator check has failed.~%	       # - >=4: no, undocumented reason.~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MovingEdgeSites)))
  "Returns full string definition for message of type 'MovingEdgeSites"
  (cl:format cl:nil "# Stamped list of moving edge positions.~%#~%# Moving edge positions associated with a particular timestamp.~%# Used by the viewer to display moving edge positions and allow~%# tracking debug.~%~%Header header                       # Header (required for synchronization).~%MovingEdgeSite[] moving_edge_sites  # List of moving dge sites (i.e. positions).~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: visp_tracker/MovingEdgeSite~%# Moving edge position.~%~%float64 x      # X position in the image~%float64 y      # Y position in the image~%int32 suppress # Is the moving edge valid?~%               # - 0:   yes~%	       # - 1:   no, constrast check has failed.~%	       # - 2:   no, threshold check has failed.~%	       # - 3:   no, M-estimator check has failed.~%	       # - >=4: no, undocumented reason.~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MovingEdgeSites>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'moving_edge_sites) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MovingEdgeSites>))
  "Converts a ROS message object to a list"
  (cl:list 'MovingEdgeSites
    (cl:cons ':header (header msg))
    (cl:cons ':moving_edge_sites (moving_edge_sites msg))
))
