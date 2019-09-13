; Auto-generated. Do not edit!


(cl:in-package visp_tracker-msg)


;//! \htmlinclude KltSettings.msg.html

(cl:defclass <KltSettings> (roslisp-msg-protocol:ros-message)
  ((max_features
    :reader max_features
    :initarg :max_features
    :type cl:integer
    :initform 0)
   (window_size
    :reader window_size
    :initarg :window_size
    :type cl:integer
    :initform 0)
   (quality
    :reader quality
    :initarg :quality
    :type cl:float
    :initform 0.0)
   (min_distance
    :reader min_distance
    :initarg :min_distance
    :type cl:float
    :initform 0.0)
   (harris
    :reader harris
    :initarg :harris
    :type cl:float
    :initform 0.0)
   (size_block
    :reader size_block
    :initarg :size_block
    :type cl:integer
    :initform 0)
   (pyramid_lvl
    :reader pyramid_lvl
    :initarg :pyramid_lvl
    :type cl:integer
    :initform 0)
   (mask_border
    :reader mask_border
    :initarg :mask_border
    :type cl:integer
    :initform 0))
)

(cl:defclass KltSettings (<KltSettings>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <KltSettings>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'KltSettings)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name visp_tracker-msg:<KltSettings> is deprecated: use visp_tracker-msg:KltSettings instead.")))

(cl:ensure-generic-function 'max_features-val :lambda-list '(m))
(cl:defmethod max_features-val ((m <KltSettings>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:max_features-val is deprecated.  Use visp_tracker-msg:max_features instead.")
  (max_features m))

(cl:ensure-generic-function 'window_size-val :lambda-list '(m))
(cl:defmethod window_size-val ((m <KltSettings>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:window_size-val is deprecated.  Use visp_tracker-msg:window_size instead.")
  (window_size m))

(cl:ensure-generic-function 'quality-val :lambda-list '(m))
(cl:defmethod quality-val ((m <KltSettings>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:quality-val is deprecated.  Use visp_tracker-msg:quality instead.")
  (quality m))

(cl:ensure-generic-function 'min_distance-val :lambda-list '(m))
(cl:defmethod min_distance-val ((m <KltSettings>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:min_distance-val is deprecated.  Use visp_tracker-msg:min_distance instead.")
  (min_distance m))

(cl:ensure-generic-function 'harris-val :lambda-list '(m))
(cl:defmethod harris-val ((m <KltSettings>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:harris-val is deprecated.  Use visp_tracker-msg:harris instead.")
  (harris m))

(cl:ensure-generic-function 'size_block-val :lambda-list '(m))
(cl:defmethod size_block-val ((m <KltSettings>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:size_block-val is deprecated.  Use visp_tracker-msg:size_block instead.")
  (size_block m))

(cl:ensure-generic-function 'pyramid_lvl-val :lambda-list '(m))
(cl:defmethod pyramid_lvl-val ((m <KltSettings>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:pyramid_lvl-val is deprecated.  Use visp_tracker-msg:pyramid_lvl instead.")
  (pyramid_lvl m))

(cl:ensure-generic-function 'mask_border-val :lambda-list '(m))
(cl:defmethod mask_border-val ((m <KltSettings>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:mask_border-val is deprecated.  Use visp_tracker-msg:mask_border instead.")
  (mask_border m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <KltSettings>) ostream)
  "Serializes a message object of type '<KltSettings>"
  (cl:let* ((signed (cl:slot-value msg 'max_features)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'window_size)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'quality))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'min_distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'harris))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'size_block)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'pyramid_lvl)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'mask_border)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <KltSettings>) istream)
  "Deserializes a message object of type '<KltSettings>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'max_features) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'window_size) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'quality) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'min_distance) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'harris) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'size_block) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pyramid_lvl) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mask_border) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<KltSettings>)))
  "Returns string type for a message object of type '<KltSettings>"
  "visp_tracker/KltSettings")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'KltSettings)))
  "Returns string type for a message object of type 'KltSettings"
  "visp_tracker/KltSettings")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<KltSettings>)))
  "Returns md5sum for a message object of type '<KltSettings>"
  "7cd8ae2f3a31d26015e8c80e88eb027a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'KltSettings)))
  "Returns md5sum for a message object of type 'KltSettings"
  "7cd8ae2f3a31d26015e8c80e88eb027a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<KltSettings>)))
  "Returns full string definition for message of type '<KltSettings>"
  (cl:format cl:nil "# This message contains tracking parameters.~%#~%# These parameters determine how precise, how fast and how~%# reliable will be the tracking.~%#~%# It should be tuned carefully and can be changed dynamically.~%#~%# For more details, see the ViSP documentation:~%# http://www.irisa.fr/lagadic/visp/publication.html~%~%# Klt Parameters.~%~%int64 max_features      # Maximum number of features~%int64 window_size       # Window size~%float64 quality         # Quality of the tracker~%float64 min_distance      # Minimum distance betwenn two points~%float64 harris          # Harris free parameters~%int64 size_block        # Block size~%int64 pyramid_lvl       # Pyramid levels~%int64 mask_border       # Mask Border~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'KltSettings)))
  "Returns full string definition for message of type 'KltSettings"
  (cl:format cl:nil "# This message contains tracking parameters.~%#~%# These parameters determine how precise, how fast and how~%# reliable will be the tracking.~%#~%# It should be tuned carefully and can be changed dynamically.~%#~%# For more details, see the ViSP documentation:~%# http://www.irisa.fr/lagadic/visp/publication.html~%~%# Klt Parameters.~%~%int64 max_features      # Maximum number of features~%int64 window_size       # Window size~%float64 quality         # Quality of the tracker~%float64 min_distance      # Minimum distance betwenn two points~%float64 harris          # Harris free parameters~%int64 size_block        # Block size~%int64 pyramid_lvl       # Pyramid levels~%int64 mask_border       # Mask Border~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <KltSettings>))
  (cl:+ 0
     8
     8
     8
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <KltSettings>))
  "Converts a ROS message object to a list"
  (cl:list 'KltSettings
    (cl:cons ':max_features (max_features msg))
    (cl:cons ':window_size (window_size msg))
    (cl:cons ':quality (quality msg))
    (cl:cons ':min_distance (min_distance msg))
    (cl:cons ':harris (harris msg))
    (cl:cons ':size_block (size_block msg))
    (cl:cons ':pyramid_lvl (pyramid_lvl msg))
    (cl:cons ':mask_border (mask_border msg))
))
