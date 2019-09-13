; Auto-generated. Do not edit!


(cl:in-package visp_tracker-msg)


;//! \htmlinclude MovingEdgeSite.msg.html

(cl:defclass <MovingEdgeSite> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (suppress
    :reader suppress
    :initarg :suppress
    :type cl:integer
    :initform 0))
)

(cl:defclass MovingEdgeSite (<MovingEdgeSite>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MovingEdgeSite>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MovingEdgeSite)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name visp_tracker-msg:<MovingEdgeSite> is deprecated: use visp_tracker-msg:MovingEdgeSite instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <MovingEdgeSite>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:x-val is deprecated.  Use visp_tracker-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <MovingEdgeSite>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:y-val is deprecated.  Use visp_tracker-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'suppress-val :lambda-list '(m))
(cl:defmethod suppress-val ((m <MovingEdgeSite>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:suppress-val is deprecated.  Use visp_tracker-msg:suppress instead.")
  (suppress m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MovingEdgeSite>) ostream)
  "Serializes a message object of type '<MovingEdgeSite>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'suppress)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MovingEdgeSite>) istream)
  "Deserializes a message object of type '<MovingEdgeSite>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'suppress) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MovingEdgeSite>)))
  "Returns string type for a message object of type '<MovingEdgeSite>"
  "visp_tracker/MovingEdgeSite")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovingEdgeSite)))
  "Returns string type for a message object of type 'MovingEdgeSite"
  "visp_tracker/MovingEdgeSite")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MovingEdgeSite>)))
  "Returns md5sum for a message object of type '<MovingEdgeSite>"
  "d67448def98304944978d0ca12803af8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MovingEdgeSite)))
  "Returns md5sum for a message object of type 'MovingEdgeSite"
  "d67448def98304944978d0ca12803af8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MovingEdgeSite>)))
  "Returns full string definition for message of type '<MovingEdgeSite>"
  (cl:format cl:nil "# Moving edge position.~%~%float64 x      # X position in the image~%float64 y      # Y position in the image~%int32 suppress # Is the moving edge valid?~%               # - 0:   yes~%	       # - 1:   no, constrast check has failed.~%	       # - 2:   no, threshold check has failed.~%	       # - 3:   no, M-estimator check has failed.~%	       # - >=4: no, undocumented reason.~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MovingEdgeSite)))
  "Returns full string definition for message of type 'MovingEdgeSite"
  (cl:format cl:nil "# Moving edge position.~%~%float64 x      # X position in the image~%float64 y      # Y position in the image~%int32 suppress # Is the moving edge valid?~%               # - 0:   yes~%	       # - 1:   no, constrast check has failed.~%	       # - 2:   no, threshold check has failed.~%	       # - 3:   no, M-estimator check has failed.~%	       # - >=4: no, undocumented reason.~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MovingEdgeSite>))
  (cl:+ 0
     8
     8
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MovingEdgeSite>))
  "Converts a ROS message object to a list"
  (cl:list 'MovingEdgeSite
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':suppress (suppress msg))
))
