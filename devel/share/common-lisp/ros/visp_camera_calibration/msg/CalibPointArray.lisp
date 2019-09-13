; Auto-generated. Do not edit!


(cl:in-package visp_camera_calibration-msg)


;//! \htmlinclude CalibPointArray.msg.html

(cl:defclass <CalibPointArray> (roslisp-msg-protocol:ros-message)
  ((points
    :reader points
    :initarg :points
    :type (cl:vector visp_camera_calibration-msg:CalibPoint)
   :initform (cl:make-array 0 :element-type 'visp_camera_calibration-msg:CalibPoint :initial-element (cl:make-instance 'visp_camera_calibration-msg:CalibPoint))))
)

(cl:defclass CalibPointArray (<CalibPointArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CalibPointArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CalibPointArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name visp_camera_calibration-msg:<CalibPointArray> is deprecated: use visp_camera_calibration-msg:CalibPointArray instead.")))

(cl:ensure-generic-function 'points-val :lambda-list '(m))
(cl:defmethod points-val ((m <CalibPointArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_camera_calibration-msg:points-val is deprecated.  Use visp_camera_calibration-msg:points instead.")
  (points m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CalibPointArray>) ostream)
  "Serializes a message object of type '<CalibPointArray>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'points))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CalibPointArray>) istream)
  "Deserializes a message object of type '<CalibPointArray>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'visp_camera_calibration-msg:CalibPoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CalibPointArray>)))
  "Returns string type for a message object of type '<CalibPointArray>"
  "visp_camera_calibration/CalibPointArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CalibPointArray)))
  "Returns string type for a message object of type 'CalibPointArray"
  "visp_camera_calibration/CalibPointArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CalibPointArray>)))
  "Returns md5sum for a message object of type '<CalibPointArray>"
  "46e7b53381d96d2d7cbbb7418f6dd696")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CalibPointArray)))
  "Returns md5sum for a message object of type 'CalibPointArray"
  "46e7b53381d96d2d7cbbb7418f6dd696")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CalibPointArray>)))
  "Returns full string definition for message of type '<CalibPointArray>"
  (cl:format cl:nil "# an array of vpPoint~%visp_camera_calibration/CalibPoint[] points~%~%================================================================================~%MSG: visp_camera_calibration/CalibPoint~%# a vpPoint~%~%int32 i~%int32 j~%float64 X~%float64 Y~%float64 Z~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CalibPointArray)))
  "Returns full string definition for message of type 'CalibPointArray"
  (cl:format cl:nil "# an array of vpPoint~%visp_camera_calibration/CalibPoint[] points~%~%================================================================================~%MSG: visp_camera_calibration/CalibPoint~%# a vpPoint~%~%int32 i~%int32 j~%float64 X~%float64 Y~%float64 Z~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CalibPointArray>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CalibPointArray>))
  "Converts a ROS message object to a list"
  (cl:list 'CalibPointArray
    (cl:cons ':points (points msg))
))
