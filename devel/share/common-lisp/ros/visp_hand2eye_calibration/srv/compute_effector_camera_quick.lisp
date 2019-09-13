; Auto-generated. Do not edit!


(cl:in-package visp_hand2eye_calibration-srv)


;//! \htmlinclude compute_effector_camera_quick-request.msg.html

(cl:defclass <compute_effector_camera_quick-request> (roslisp-msg-protocol:ros-message)
  ((camera_object
    :reader camera_object
    :initarg :camera_object
    :type visp_hand2eye_calibration-msg:TransformArray
    :initform (cl:make-instance 'visp_hand2eye_calibration-msg:TransformArray))
   (world_effector
    :reader world_effector
    :initarg :world_effector
    :type visp_hand2eye_calibration-msg:TransformArray
    :initform (cl:make-instance 'visp_hand2eye_calibration-msg:TransformArray)))
)

(cl:defclass compute_effector_camera_quick-request (<compute_effector_camera_quick-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <compute_effector_camera_quick-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'compute_effector_camera_quick-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name visp_hand2eye_calibration-srv:<compute_effector_camera_quick-request> is deprecated: use visp_hand2eye_calibration-srv:compute_effector_camera_quick-request instead.")))

(cl:ensure-generic-function 'camera_object-val :lambda-list '(m))
(cl:defmethod camera_object-val ((m <compute_effector_camera_quick-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_hand2eye_calibration-srv:camera_object-val is deprecated.  Use visp_hand2eye_calibration-srv:camera_object instead.")
  (camera_object m))

(cl:ensure-generic-function 'world_effector-val :lambda-list '(m))
(cl:defmethod world_effector-val ((m <compute_effector_camera_quick-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_hand2eye_calibration-srv:world_effector-val is deprecated.  Use visp_hand2eye_calibration-srv:world_effector instead.")
  (world_effector m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <compute_effector_camera_quick-request>) ostream)
  "Serializes a message object of type '<compute_effector_camera_quick-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'camera_object) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'world_effector) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <compute_effector_camera_quick-request>) istream)
  "Deserializes a message object of type '<compute_effector_camera_quick-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'camera_object) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'world_effector) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<compute_effector_camera_quick-request>)))
  "Returns string type for a service object of type '<compute_effector_camera_quick-request>"
  "visp_hand2eye_calibration/compute_effector_camera_quickRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'compute_effector_camera_quick-request)))
  "Returns string type for a service object of type 'compute_effector_camera_quick-request"
  "visp_hand2eye_calibration/compute_effector_camera_quickRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<compute_effector_camera_quick-request>)))
  "Returns md5sum for a message object of type '<compute_effector_camera_quick-request>"
  "ac7e8b661c5bfedda75b54410a11cf73")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'compute_effector_camera_quick-request)))
  "Returns md5sum for a message object of type 'compute_effector_camera_quick-request"
  "ac7e8b661c5bfedda75b54410a11cf73")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<compute_effector_camera_quick-request>)))
  "Returns full string definition for message of type '<compute_effector_camera_quick-request>"
  (cl:format cl:nil "~%~%~%visp_hand2eye_calibration/TransformArray camera_object~%visp_hand2eye_calibration/TransformArray world_effector~%~%================================================================================~%MSG: visp_hand2eye_calibration/TransformArray~%# An array of transforms with a header for global reference.~%~%Header header~%~%geometry_msgs/Transform[] transforms~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'compute_effector_camera_quick-request)))
  "Returns full string definition for message of type 'compute_effector_camera_quick-request"
  (cl:format cl:nil "~%~%~%visp_hand2eye_calibration/TransformArray camera_object~%visp_hand2eye_calibration/TransformArray world_effector~%~%================================================================================~%MSG: visp_hand2eye_calibration/TransformArray~%# An array of transforms with a header for global reference.~%~%Header header~%~%geometry_msgs/Transform[] transforms~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <compute_effector_camera_quick-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'camera_object))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'world_effector))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <compute_effector_camera_quick-request>))
  "Converts a ROS message object to a list"
  (cl:list 'compute_effector_camera_quick-request
    (cl:cons ':camera_object (camera_object msg))
    (cl:cons ':world_effector (world_effector msg))
))
;//! \htmlinclude compute_effector_camera_quick-response.msg.html

(cl:defclass <compute_effector_camera_quick-response> (roslisp-msg-protocol:ros-message)
  ((effector_camera
    :reader effector_camera
    :initarg :effector_camera
    :type geometry_msgs-msg:Transform
    :initform (cl:make-instance 'geometry_msgs-msg:Transform)))
)

(cl:defclass compute_effector_camera_quick-response (<compute_effector_camera_quick-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <compute_effector_camera_quick-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'compute_effector_camera_quick-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name visp_hand2eye_calibration-srv:<compute_effector_camera_quick-response> is deprecated: use visp_hand2eye_calibration-srv:compute_effector_camera_quick-response instead.")))

(cl:ensure-generic-function 'effector_camera-val :lambda-list '(m))
(cl:defmethod effector_camera-val ((m <compute_effector_camera_quick-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_hand2eye_calibration-srv:effector_camera-val is deprecated.  Use visp_hand2eye_calibration-srv:effector_camera instead.")
  (effector_camera m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <compute_effector_camera_quick-response>) ostream)
  "Serializes a message object of type '<compute_effector_camera_quick-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'effector_camera) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <compute_effector_camera_quick-response>) istream)
  "Deserializes a message object of type '<compute_effector_camera_quick-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'effector_camera) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<compute_effector_camera_quick-response>)))
  "Returns string type for a service object of type '<compute_effector_camera_quick-response>"
  "visp_hand2eye_calibration/compute_effector_camera_quickResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'compute_effector_camera_quick-response)))
  "Returns string type for a service object of type 'compute_effector_camera_quick-response"
  "visp_hand2eye_calibration/compute_effector_camera_quickResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<compute_effector_camera_quick-response>)))
  "Returns md5sum for a message object of type '<compute_effector_camera_quick-response>"
  "ac7e8b661c5bfedda75b54410a11cf73")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'compute_effector_camera_quick-response)))
  "Returns md5sum for a message object of type 'compute_effector_camera_quick-response"
  "ac7e8b661c5bfedda75b54410a11cf73")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<compute_effector_camera_quick-response>)))
  "Returns full string definition for message of type '<compute_effector_camera_quick-response>"
  (cl:format cl:nil "geometry_msgs/Transform effector_camera~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'compute_effector_camera_quick-response)))
  "Returns full string definition for message of type 'compute_effector_camera_quick-response"
  (cl:format cl:nil "geometry_msgs/Transform effector_camera~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <compute_effector_camera_quick-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'effector_camera))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <compute_effector_camera_quick-response>))
  "Converts a ROS message object to a list"
  (cl:list 'compute_effector_camera_quick-response
    (cl:cons ':effector_camera (effector_camera msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'compute_effector_camera_quick)))
  'compute_effector_camera_quick-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'compute_effector_camera_quick)))
  'compute_effector_camera_quick-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'compute_effector_camera_quick)))
  "Returns string type for a service object of type '<compute_effector_camera_quick>"
  "visp_hand2eye_calibration/compute_effector_camera_quick")