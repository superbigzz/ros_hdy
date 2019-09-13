; Auto-generated. Do not edit!


(cl:in-package visp_hand2eye_calibration-srv)


;//! \htmlinclude compute_effector_camera-request.msg.html

(cl:defclass <compute_effector_camera-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass compute_effector_camera-request (<compute_effector_camera-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <compute_effector_camera-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'compute_effector_camera-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name visp_hand2eye_calibration-srv:<compute_effector_camera-request> is deprecated: use visp_hand2eye_calibration-srv:compute_effector_camera-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <compute_effector_camera-request>) ostream)
  "Serializes a message object of type '<compute_effector_camera-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <compute_effector_camera-request>) istream)
  "Deserializes a message object of type '<compute_effector_camera-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<compute_effector_camera-request>)))
  "Returns string type for a service object of type '<compute_effector_camera-request>"
  "visp_hand2eye_calibration/compute_effector_cameraRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'compute_effector_camera-request)))
  "Returns string type for a service object of type 'compute_effector_camera-request"
  "visp_hand2eye_calibration/compute_effector_cameraRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<compute_effector_camera-request>)))
  "Returns md5sum for a message object of type '<compute_effector_camera-request>"
  "e28a9ea34e6e135a6309cbdf6fb0ad0d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'compute_effector_camera-request)))
  "Returns md5sum for a message object of type 'compute_effector_camera-request"
  "e28a9ea34e6e135a6309cbdf6fb0ad0d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<compute_effector_camera-request>)))
  "Returns full string definition for message of type '<compute_effector_camera-request>"
  (cl:format cl:nil "~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'compute_effector_camera-request)))
  "Returns full string definition for message of type 'compute_effector_camera-request"
  (cl:format cl:nil "~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <compute_effector_camera-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <compute_effector_camera-request>))
  "Converts a ROS message object to a list"
  (cl:list 'compute_effector_camera-request
))
;//! \htmlinclude compute_effector_camera-response.msg.html

(cl:defclass <compute_effector_camera-response> (roslisp-msg-protocol:ros-message)
  ((effector_camera
    :reader effector_camera
    :initarg :effector_camera
    :type geometry_msgs-msg:Transform
    :initform (cl:make-instance 'geometry_msgs-msg:Transform)))
)

(cl:defclass compute_effector_camera-response (<compute_effector_camera-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <compute_effector_camera-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'compute_effector_camera-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name visp_hand2eye_calibration-srv:<compute_effector_camera-response> is deprecated: use visp_hand2eye_calibration-srv:compute_effector_camera-response instead.")))

(cl:ensure-generic-function 'effector_camera-val :lambda-list '(m))
(cl:defmethod effector_camera-val ((m <compute_effector_camera-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_hand2eye_calibration-srv:effector_camera-val is deprecated.  Use visp_hand2eye_calibration-srv:effector_camera instead.")
  (effector_camera m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <compute_effector_camera-response>) ostream)
  "Serializes a message object of type '<compute_effector_camera-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'effector_camera) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <compute_effector_camera-response>) istream)
  "Deserializes a message object of type '<compute_effector_camera-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'effector_camera) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<compute_effector_camera-response>)))
  "Returns string type for a service object of type '<compute_effector_camera-response>"
  "visp_hand2eye_calibration/compute_effector_cameraResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'compute_effector_camera-response)))
  "Returns string type for a service object of type 'compute_effector_camera-response"
  "visp_hand2eye_calibration/compute_effector_cameraResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<compute_effector_camera-response>)))
  "Returns md5sum for a message object of type '<compute_effector_camera-response>"
  "e28a9ea34e6e135a6309cbdf6fb0ad0d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'compute_effector_camera-response)))
  "Returns md5sum for a message object of type 'compute_effector_camera-response"
  "e28a9ea34e6e135a6309cbdf6fb0ad0d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<compute_effector_camera-response>)))
  "Returns full string definition for message of type '<compute_effector_camera-response>"
  (cl:format cl:nil "geometry_msgs/Transform effector_camera~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'compute_effector_camera-response)))
  "Returns full string definition for message of type 'compute_effector_camera-response"
  (cl:format cl:nil "geometry_msgs/Transform effector_camera~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <compute_effector_camera-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'effector_camera))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <compute_effector_camera-response>))
  "Converts a ROS message object to a list"
  (cl:list 'compute_effector_camera-response
    (cl:cons ':effector_camera (effector_camera msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'compute_effector_camera)))
  'compute_effector_camera-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'compute_effector_camera)))
  'compute_effector_camera-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'compute_effector_camera)))
  "Returns string type for a service object of type '<compute_effector_camera>"
  "visp_hand2eye_calibration/compute_effector_camera")