; Auto-generated. Do not edit!


(cl:in-package visp_tracker-msg)


;//! \htmlinclude KltPoints.msg.html

(cl:defclass <KltPoints> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (klt_points_positions
    :reader klt_points_positions
    :initarg :klt_points_positions
    :type (cl:vector visp_tracker-msg:KltPoint)
   :initform (cl:make-array 0 :element-type 'visp_tracker-msg:KltPoint :initial-element (cl:make-instance 'visp_tracker-msg:KltPoint))))
)

(cl:defclass KltPoints (<KltPoints>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <KltPoints>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'KltPoints)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name visp_tracker-msg:<KltPoints> is deprecated: use visp_tracker-msg:KltPoints instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <KltPoints>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:header-val is deprecated.  Use visp_tracker-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'klt_points_positions-val :lambda-list '(m))
(cl:defmethod klt_points_positions-val ((m <KltPoints>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:klt_points_positions-val is deprecated.  Use visp_tracker-msg:klt_points_positions instead.")
  (klt_points_positions m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <KltPoints>) ostream)
  "Serializes a message object of type '<KltPoints>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'klt_points_positions))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'klt_points_positions))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <KltPoints>) istream)
  "Deserializes a message object of type '<KltPoints>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'klt_points_positions) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'klt_points_positions)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'visp_tracker-msg:KltPoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<KltPoints>)))
  "Returns string type for a message object of type '<KltPoints>"
  "visp_tracker/KltPoints")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'KltPoints)))
  "Returns string type for a message object of type 'KltPoints"
  "visp_tracker/KltPoints")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<KltPoints>)))
  "Returns md5sum for a message object of type '<KltPoints>"
  "681548d0f72044b7f086e3985d86f93c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'KltPoints)))
  "Returns md5sum for a message object of type 'KltPoints"
  "681548d0f72044b7f086e3985d86f93c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<KltPoints>)))
  "Returns full string definition for message of type '<KltPoints>"
  (cl:format cl:nil "# Stamped list of KLT points positions.~%#~%# KLT points positions associated with a particular timestamp.~%# Used by the viewer to display KLT points positions and allow~%# tracking debug.~%~%Header header                        # Header (required for synchronization).~%KltPoint[] klt_points_positions      # List of KLT points positions.~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: visp_tracker/KltPoint~%# KLT point position.~%~%float64 i      # i position in the image~%float64 j      # j position in the image~%int32   id     # Point id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'KltPoints)))
  "Returns full string definition for message of type 'KltPoints"
  (cl:format cl:nil "# Stamped list of KLT points positions.~%#~%# KLT points positions associated with a particular timestamp.~%# Used by the viewer to display KLT points positions and allow~%# tracking debug.~%~%Header header                        # Header (required for synchronization).~%KltPoint[] klt_points_positions      # List of KLT points positions.~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: visp_tracker/KltPoint~%# KLT point position.~%~%float64 i      # i position in the image~%float64 j      # j position in the image~%int32   id     # Point id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <KltPoints>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'klt_points_positions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <KltPoints>))
  "Converts a ROS message object to a list"
  (cl:list 'KltPoints
    (cl:cons ':header (header msg))
    (cl:cons ':klt_points_positions (klt_points_positions msg))
))
