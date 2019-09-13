; Auto-generated. Do not edit!


(cl:in-package visp_tracker-msg)


;//! \htmlinclude KltPoint.msg.html

(cl:defclass <KltPoint> (roslisp-msg-protocol:ros-message)
  ((i
    :reader i
    :initarg :i
    :type cl:float
    :initform 0.0)
   (j
    :reader j
    :initarg :j
    :type cl:float
    :initform 0.0)
   (id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0))
)

(cl:defclass KltPoint (<KltPoint>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <KltPoint>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'KltPoint)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name visp_tracker-msg:<KltPoint> is deprecated: use visp_tracker-msg:KltPoint instead.")))

(cl:ensure-generic-function 'i-val :lambda-list '(m))
(cl:defmethod i-val ((m <KltPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:i-val is deprecated.  Use visp_tracker-msg:i instead.")
  (i m))

(cl:ensure-generic-function 'j-val :lambda-list '(m))
(cl:defmethod j-val ((m <KltPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:j-val is deprecated.  Use visp_tracker-msg:j instead.")
  (j m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <KltPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-msg:id-val is deprecated.  Use visp_tracker-msg:id instead.")
  (id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <KltPoint>) ostream)
  "Serializes a message object of type '<KltPoint>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'i))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'j))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <KltPoint>) istream)
  "Deserializes a message object of type '<KltPoint>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'i) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'j) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<KltPoint>)))
  "Returns string type for a message object of type '<KltPoint>"
  "visp_tracker/KltPoint")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'KltPoint)))
  "Returns string type for a message object of type 'KltPoint"
  "visp_tracker/KltPoint")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<KltPoint>)))
  "Returns md5sum for a message object of type '<KltPoint>"
  "6014cf727908e3e35d0048962e94796f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'KltPoint)))
  "Returns md5sum for a message object of type 'KltPoint"
  "6014cf727908e3e35d0048962e94796f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<KltPoint>)))
  "Returns full string definition for message of type '<KltPoint>"
  (cl:format cl:nil "# KLT point position.~%~%float64 i      # i position in the image~%float64 j      # j position in the image~%int32   id     # Point id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'KltPoint)))
  "Returns full string definition for message of type 'KltPoint"
  (cl:format cl:nil "# KLT point position.~%~%float64 i      # i position in the image~%float64 j      # j position in the image~%int32   id     # Point id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <KltPoint>))
  (cl:+ 0
     8
     8
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <KltPoint>))
  "Converts a ROS message object to a list"
  (cl:list 'KltPoint
    (cl:cons ':i (i msg))
    (cl:cons ':j (j msg))
    (cl:cons ':id (id msg))
))
