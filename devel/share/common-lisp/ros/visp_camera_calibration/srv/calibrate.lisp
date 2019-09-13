; Auto-generated. Do not edit!


(cl:in-package visp_camera_calibration-srv)


;//! \htmlinclude calibrate-request.msg.html

(cl:defclass <calibrate-request> (roslisp-msg-protocol:ros-message)
  ((method
    :reader method
    :initarg :method
    :type cl:integer
    :initform 0)
   (sample_width
    :reader sample_width
    :initarg :sample_width
    :type cl:integer
    :initform 0)
   (sample_height
    :reader sample_height
    :initarg :sample_height
    :type cl:integer
    :initform 0))
)

(cl:defclass calibrate-request (<calibrate-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <calibrate-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'calibrate-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name visp_camera_calibration-srv:<calibrate-request> is deprecated: use visp_camera_calibration-srv:calibrate-request instead.")))

(cl:ensure-generic-function 'method-val :lambda-list '(m))
(cl:defmethod method-val ((m <calibrate-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_camera_calibration-srv:method-val is deprecated.  Use visp_camera_calibration-srv:method instead.")
  (method m))

(cl:ensure-generic-function 'sample_width-val :lambda-list '(m))
(cl:defmethod sample_width-val ((m <calibrate-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_camera_calibration-srv:sample_width-val is deprecated.  Use visp_camera_calibration-srv:sample_width instead.")
  (sample_width m))

(cl:ensure-generic-function 'sample_height-val :lambda-list '(m))
(cl:defmethod sample_height-val ((m <calibrate-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_camera_calibration-srv:sample_height-val is deprecated.  Use visp_camera_calibration-srv:sample_height instead.")
  (sample_height m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <calibrate-request>) ostream)
  "Serializes a message object of type '<calibrate-request>"
  (cl:let* ((signed (cl:slot-value msg 'method)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'sample_width)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'sample_height)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <calibrate-request>) istream)
  "Deserializes a message object of type '<calibrate-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'method) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sample_width) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sample_height) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<calibrate-request>)))
  "Returns string type for a service object of type '<calibrate-request>"
  "visp_camera_calibration/calibrateRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'calibrate-request)))
  "Returns string type for a service object of type 'calibrate-request"
  "visp_camera_calibration/calibrateRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<calibrate-request>)))
  "Returns md5sum for a message object of type '<calibrate-request>"
  "30e17d7747033ddb69c9980395e78d44")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'calibrate-request)))
  "Returns md5sum for a message object of type 'calibrate-request"
  "30e17d7747033ddb69c9980395e78d44")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<calibrate-request>)))
  "Returns full string definition for message of type '<calibrate-request>"
  (cl:format cl:nil "int32 method~%int32 sample_width~%int32 sample_height~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'calibrate-request)))
  "Returns full string definition for message of type 'calibrate-request"
  (cl:format cl:nil "int32 method~%int32 sample_width~%int32 sample_height~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <calibrate-request>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <calibrate-request>))
  "Converts a ROS message object to a list"
  (cl:list 'calibrate-request
    (cl:cons ':method (method msg))
    (cl:cons ':sample_width (sample_width msg))
    (cl:cons ':sample_height (sample_height msg))
))
;//! \htmlinclude calibrate-response.msg.html

(cl:defclass <calibrate-response> (roslisp-msg-protocol:ros-message)
  ((stdDevErrs
    :reader stdDevErrs
    :initarg :stdDevErrs
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass calibrate-response (<calibrate-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <calibrate-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'calibrate-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name visp_camera_calibration-srv:<calibrate-response> is deprecated: use visp_camera_calibration-srv:calibrate-response instead.")))

(cl:ensure-generic-function 'stdDevErrs-val :lambda-list '(m))
(cl:defmethod stdDevErrs-val ((m <calibrate-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_camera_calibration-srv:stdDevErrs-val is deprecated.  Use visp_camera_calibration-srv:stdDevErrs instead.")
  (stdDevErrs m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <calibrate-response>) ostream)
  "Serializes a message object of type '<calibrate-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'stdDevErrs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'stdDevErrs))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <calibrate-response>) istream)
  "Deserializes a message object of type '<calibrate-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'stdDevErrs) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'stdDevErrs)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<calibrate-response>)))
  "Returns string type for a service object of type '<calibrate-response>"
  "visp_camera_calibration/calibrateResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'calibrate-response)))
  "Returns string type for a service object of type 'calibrate-response"
  "visp_camera_calibration/calibrateResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<calibrate-response>)))
  "Returns md5sum for a message object of type '<calibrate-response>"
  "30e17d7747033ddb69c9980395e78d44")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'calibrate-response)))
  "Returns md5sum for a message object of type 'calibrate-response"
  "30e17d7747033ddb69c9980395e78d44")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<calibrate-response>)))
  "Returns full string definition for message of type '<calibrate-response>"
  (cl:format cl:nil "float64[] stdDevErrs~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'calibrate-response)))
  "Returns full string definition for message of type 'calibrate-response"
  (cl:format cl:nil "float64[] stdDevErrs~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <calibrate-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'stdDevErrs) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <calibrate-response>))
  "Converts a ROS message object to a list"
  (cl:list 'calibrate-response
    (cl:cons ':stdDevErrs (stdDevErrs msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'calibrate)))
  'calibrate-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'calibrate)))
  'calibrate-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'calibrate)))
  "Returns string type for a service object of type '<calibrate>"
  "visp_camera_calibration/calibrate")