; Auto-generated. Do not edit!


(cl:in-package visp_tracker-msg)


;//! \htmlinclude TrackerSettings.msg.html

(cl:defclass <TrackerSettings> (roslisp-msg-protocol:ros-message)
  ((angle_appear
    :reader angle_appear
    :initarg :angle_appear
    :type cl:float
    :initform 0.0)
   (angle_disappear
    :reader angle_disappear
    :initarg :angle_disappear
    :type cl:float
    :initform 0.0))
)

(cl:defclass TrackerSettings (<TrackerSettings>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrackerSettings>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrackerSettings)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name visp_tracker-msg:<TrackerSettings> is deprecated: use visp_tracker-msg:TrackerSettings instead.")))

(cl:ensure-generic-function 'angle_appear-val :lambda-list '(m))
(cl:defmethod angle_appear-val ((m <TrackerSettings>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:angle_appear-val is deprecated.  Use visp_tracker-msg:angle_appear instead.")
  (angle_appear m))

(cl:ensure-generic-function 'angle_disappear-val :lambda-list '(m))
(cl:defmethod angle_disappear-val ((m <TrackerSettings>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:angle_disappear-val is deprecated.  Use visp_tracker-msg:angle_disappear instead.")
  (angle_disappear m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrackerSettings>) ostream)
  "Serializes a message object of type '<TrackerSettings>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angle_appear))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angle_disappear))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrackerSettings>) istream)
  "Deserializes a message object of type '<TrackerSettings>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle_appear) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle_disappear) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrackerSettings>)))
  "Returns string type for a message object of type '<TrackerSettings>"
  "visp_tracker/TrackerSettings")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrackerSettings)))
  "Returns string type for a message object of type 'TrackerSettings"
  "visp_tracker/TrackerSettings")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrackerSettings>)))
  "Returns md5sum for a message object of type '<TrackerSettings>"
  "3af7f3dad594635cfe340be2c0b60a68")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrackerSettings)))
  "Returns md5sum for a message object of type 'TrackerSettings"
  "3af7f3dad594635cfe340be2c0b60a68")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrackerSettings>)))
  "Returns full string definition for message of type '<TrackerSettings>"
  (cl:format cl:nil "# This message contains tracking parameters.~%#~%# These parameters determine how precise, how fast and how~%# reliable will be the tracking.~%#~%# It should be tuned carefully and can be changed dynamically.~%#~%# For more details, see the ViSP documentation:~%# http://www.irisa.fr/lagadic/visp/publication.html~%~%# Common Tracker Parameters.~%float64 angle_appear    # Angle to test faces apparition~%float64 angle_disappear # Angle to test faces disparition~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrackerSettings)))
  "Returns full string definition for message of type 'TrackerSettings"
  (cl:format cl:nil "# This message contains tracking parameters.~%#~%# These parameters determine how precise, how fast and how~%# reliable will be the tracking.~%#~%# It should be tuned carefully and can be changed dynamically.~%#~%# For more details, see the ViSP documentation:~%# http://www.irisa.fr/lagadic/visp/publication.html~%~%# Common Tracker Parameters.~%float64 angle_appear    # Angle to test faces apparition~%float64 angle_disappear # Angle to test faces disparition~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrackerSettings>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrackerSettings>))
  "Converts a ROS message object to a list"
  (cl:list 'TrackerSettings
    (cl:cons ':angle_appear (angle_appear msg))
    (cl:cons ':angle_disappear (angle_disappear msg))
))
