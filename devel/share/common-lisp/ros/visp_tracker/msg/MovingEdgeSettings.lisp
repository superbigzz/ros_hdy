; Auto-generated. Do not edit!


(cl:in-package visp_tracker-msg)


;//! \htmlinclude MovingEdgeSettings.msg.html

(cl:defclass <MovingEdgeSettings> (roslisp-msg-protocol:ros-message)
  ((mask_size
    :reader mask_size
    :initarg :mask_size
    :type cl:integer
    :initform 0)
   (range
    :reader range
    :initarg :range
    :type cl:integer
    :initform 0)
   (threshold
    :reader threshold
    :initarg :threshold
    :type cl:float
    :initform 0.0)
   (mu1
    :reader mu1
    :initarg :mu1
    :type cl:float
    :initform 0.0)
   (mu2
    :reader mu2
    :initarg :mu2
    :type cl:float
    :initform 0.0)
   (sample_step
    :reader sample_step
    :initarg :sample_step
    :type cl:integer
    :initform 0)
   (strip
    :reader strip
    :initarg :strip
    :type cl:integer
    :initform 0)
   (first_threshold
    :reader first_threshold
    :initarg :first_threshold
    :type cl:float
    :initform 0.0))
)

(cl:defclass MovingEdgeSettings (<MovingEdgeSettings>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MovingEdgeSettings>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MovingEdgeSettings)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name visp_tracker-msg:<MovingEdgeSettings> is deprecated: use visp_tracker-msg:MovingEdgeSettings instead.")))

(cl:ensure-generic-function 'mask_size-val :lambda-list '(m))
(cl:defmethod mask_size-val ((m <MovingEdgeSettings>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:mask_size-val is deprecated.  Use visp_tracker-msg:mask_size instead.")
  (mask_size m))

(cl:ensure-generic-function 'range-val :lambda-list '(m))
(cl:defmethod range-val ((m <MovingEdgeSettings>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:range-val is deprecated.  Use visp_tracker-msg:range instead.")
  (range m))

(cl:ensure-generic-function 'threshold-val :lambda-list '(m))
(cl:defmethod threshold-val ((m <MovingEdgeSettings>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:threshold-val is deprecated.  Use visp_tracker-msg:threshold instead.")
  (threshold m))

(cl:ensure-generic-function 'mu1-val :lambda-list '(m))
(cl:defmethod mu1-val ((m <MovingEdgeSettings>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:mu1-val is deprecated.  Use visp_tracker-msg:mu1 instead.")
  (mu1 m))

(cl:ensure-generic-function 'mu2-val :lambda-list '(m))
(cl:defmethod mu2-val ((m <MovingEdgeSettings>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:mu2-val is deprecated.  Use visp_tracker-msg:mu2 instead.")
  (mu2 m))

(cl:ensure-generic-function 'sample_step-val :lambda-list '(m))
(cl:defmethod sample_step-val ((m <MovingEdgeSettings>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:sample_step-val is deprecated.  Use visp_tracker-msg:sample_step instead.")
  (sample_step m))

(cl:ensure-generic-function 'strip-val :lambda-list '(m))
(cl:defmethod strip-val ((m <MovingEdgeSettings>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:strip-val is deprecated.  Use visp_tracker-msg:strip instead.")
  (strip m))

(cl:ensure-generic-function 'first_threshold-val :lambda-list '(m))
(cl:defmethod first_threshold-val ((m <MovingEdgeSettings>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:first_threshold-val is deprecated.  Use visp_tracker-msg:first_threshold instead.")
  (first_threshold m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MovingEdgeSettings>) ostream)
  "Serializes a message object of type '<MovingEdgeSettings>"
  (cl:let* ((signed (cl:slot-value msg 'mask_size)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'range)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'threshold))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'mu1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'mu2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'sample_step)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'strip)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'first_threshold))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MovingEdgeSettings>) istream)
  "Deserializes a message object of type '<MovingEdgeSettings>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mask_size) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'range) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'threshold) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mu1) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mu2) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sample_step) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'strip) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'first_threshold) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MovingEdgeSettings>)))
  "Returns string type for a message object of type '<MovingEdgeSettings>"
  "visp_tracker/MovingEdgeSettings")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovingEdgeSettings)))
  "Returns string type for a message object of type 'MovingEdgeSettings"
  "visp_tracker/MovingEdgeSettings")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MovingEdgeSettings>)))
  "Returns md5sum for a message object of type '<MovingEdgeSettings>"
  "4e8f98b7dec6ffa099529044b3472486")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MovingEdgeSettings)))
  "Returns md5sum for a message object of type 'MovingEdgeSettings"
  "4e8f98b7dec6ffa099529044b3472486")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MovingEdgeSettings>)))
  "Returns full string definition for message of type '<MovingEdgeSettings>"
  (cl:format cl:nil "# This message contains tracking parameters.~%#~%# These parameters determine how precise, how fast and how~%# reliable will be the tracking.~%#~%# It should be tuned carefully and can be changed dynamically.~%#~%# For more details, see the ViSP documentation:~%# http://www.irisa.fr/lagadic/visp/publication.html~%~%~%# Moving edge parameters.~%~%int64 mask_size    # Mask size (in pixel) used to compute the image gradient~%                   # and determine the object contour.~%		   # A larger mask size is better for larger images.~%		   # 3 pixels is enough for 640x480 images.~%                   # Increasing this value makes the tracking slower.~%		   #~%		   # Caution: this value cannot be changed dynamically~%		   # without resetting the tracking.~%~%int64 range        # Maximum seek distance on both sides of the reference pixel.~%      		   # It should match the maximum distance in pixel between~%		   # the current position of the feature projection and~%		   # its next position.~%		   # I.e. if the object moves fast and your tracking~%		   # frequency is low, this value should be increased.~%                   # Increasing this value makes the tracking slower.~%~%float64 threshold  # Value used to determine if a moving edge is valid~%		   # or not.~%~%float64 mu1        # Minimum image contrast allowed to detect a contour.~%float64 mu2        # Maximum image contrast allowed to detect a contour.~%~%int64 sample_step   # Minimum distance in pixel between two~%      		    # discretization points.~%      		    # It avoids having too many discretization points when~%		    # the tracked object is far away (and its projection~%		    # in the image is small).~%		    # Increasing this value makes the tracking *faster*.~%~%int64 strip             # How many pixels are ignored around the borders.~%~%~%# Tracker parameters.~%~%float64 first_threshold # What proportion of points should be valid to~%                        # acccept an initial pose.~%			# Value should be between 0 et 1.~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MovingEdgeSettings)))
  "Returns full string definition for message of type 'MovingEdgeSettings"
  (cl:format cl:nil "# This message contains tracking parameters.~%#~%# These parameters determine how precise, how fast and how~%# reliable will be the tracking.~%#~%# It should be tuned carefully and can be changed dynamically.~%#~%# For more details, see the ViSP documentation:~%# http://www.irisa.fr/lagadic/visp/publication.html~%~%~%# Moving edge parameters.~%~%int64 mask_size    # Mask size (in pixel) used to compute the image gradient~%                   # and determine the object contour.~%		   # A larger mask size is better for larger images.~%		   # 3 pixels is enough for 640x480 images.~%                   # Increasing this value makes the tracking slower.~%		   #~%		   # Caution: this value cannot be changed dynamically~%		   # without resetting the tracking.~%~%int64 range        # Maximum seek distance on both sides of the reference pixel.~%      		   # It should match the maximum distance in pixel between~%		   # the current position of the feature projection and~%		   # its next position.~%		   # I.e. if the object moves fast and your tracking~%		   # frequency is low, this value should be increased.~%                   # Increasing this value makes the tracking slower.~%~%float64 threshold  # Value used to determine if a moving edge is valid~%		   # or not.~%~%float64 mu1        # Minimum image contrast allowed to detect a contour.~%float64 mu2        # Maximum image contrast allowed to detect a contour.~%~%int64 sample_step   # Minimum distance in pixel between two~%      		    # discretization points.~%      		    # It avoids having too many discretization points when~%		    # the tracked object is far away (and its projection~%		    # in the image is small).~%		    # Increasing this value makes the tracking *faster*.~%~%int64 strip             # How many pixels are ignored around the borders.~%~%~%# Tracker parameters.~%~%float64 first_threshold # What proportion of points should be valid to~%                        # acccept an initial pose.~%			# Value should be between 0 et 1.~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MovingEdgeSettings>))
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
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MovingEdgeSettings>))
  "Converts a ROS message object to a list"
  (cl:list 'MovingEdgeSettings
    (cl:cons ':mask_size (mask_size msg))
    (cl:cons ':range (range msg))
    (cl:cons ':threshold (threshold msg))
    (cl:cons ':mu1 (mu1 msg))
    (cl:cons ':mu2 (mu2 msg))
    (cl:cons ':sample_step (sample_step msg))
    (cl:cons ':strip (strip msg))
    (cl:cons ':first_threshold (first_threshold msg))
))
