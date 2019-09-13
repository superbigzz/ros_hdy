; Auto-generated. Do not edit!


(cl:in-package visp_camera_calibration-msg)


;//! \htmlinclude ImagePoint.msg.html

(cl:defclass <ImagePoint> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:integer
    :initform 0)
   (y
    :reader y
    :initarg :y
    :type cl:integer
    :initform 0))
)

(cl:defclass ImagePoint (<ImagePoint>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ImagePoint>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ImagePoint)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name visp_camera_calibration-msg:<ImagePoint> is deprecated: use visp_camera_calibration-msg:ImagePoint instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <ImagePoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_camera_calibration-msg:x-val is deprecated.  Use visp_camera_calibration-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <ImagePoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_camera_calibration-msg:y-val is deprecated.  Use visp_camera_calibration-msg:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ImagePoint>) ostream)
  "Serializes a message object of type '<ImagePoint>"
  (cl:let* ((signed (cl:slot-value msg 'x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ImagePoint>) istream)
  "Deserializes a message object of type '<ImagePoint>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ImagePoint>)))
  "Returns string type for a message object of type '<ImagePoint>"
  "visp_camera_calibration/ImagePoint")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ImagePoint)))
  "Returns string type for a message object of type 'ImagePoint"
  "visp_camera_calibration/ImagePoint")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ImagePoint>)))
  "Returns md5sum for a message object of type '<ImagePoint>"
  "bd7b43fd41d4c47bf5c703cc7d016709")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ImagePoint)))
  "Returns md5sum for a message object of type 'ImagePoint"
  "bd7b43fd41d4c47bf5c703cc7d016709")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ImagePoint>)))
  "Returns full string definition for message of type '<ImagePoint>"
  (cl:format cl:nil "# a point (pixel coordinates) selected in an image~%~%int32 x~%int32 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ImagePoint)))
  "Returns full string definition for message of type 'ImagePoint"
  (cl:format cl:nil "# a point (pixel coordinates) selected in an image~%~%int32 x~%int32 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ImagePoint>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ImagePoint>))
  "Converts a ROS message object to a list"
  (cl:list 'ImagePoint
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
))
