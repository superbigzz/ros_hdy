; Auto-generated. Do not edit!


(cl:in-package visp_hand2eye_calibration-srv)


;//! \htmlinclude reset-request.msg.html

(cl:defclass <reset-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass reset-request (<reset-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <reset-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'reset-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name visp_hand2eye_calibration-srv:<reset-request> is deprecated: use visp_hand2eye_calibration-srv:reset-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <reset-request>) ostream)
  "Serializes a message object of type '<reset-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <reset-request>) istream)
  "Deserializes a message object of type '<reset-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<reset-request>)))
  "Returns string type for a service object of type '<reset-request>"
  "visp_hand2eye_calibration/resetRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'reset-request)))
  "Returns string type for a service object of type 'reset-request"
  "visp_hand2eye_calibration/resetRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<reset-request>)))
  "Returns md5sum for a message object of type '<reset-request>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'reset-request)))
  "Returns md5sum for a message object of type 'reset-request"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<reset-request>)))
  "Returns full string definition for message of type '<reset-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'reset-request)))
  "Returns full string definition for message of type 'reset-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <reset-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <reset-request>))
  "Converts a ROS message object to a list"
  (cl:list 'reset-request
))
;//! \htmlinclude reset-response.msg.html

(cl:defclass <reset-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass reset-response (<reset-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <reset-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'reset-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name visp_hand2eye_calibration-srv:<reset-response> is deprecated: use visp_hand2eye_calibration-srv:reset-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <reset-response>) ostream)
  "Serializes a message object of type '<reset-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <reset-response>) istream)
  "Deserializes a message object of type '<reset-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<reset-response>)))
  "Returns string type for a service object of type '<reset-response>"
  "visp_hand2eye_calibration/resetResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'reset-response)))
  "Returns string type for a service object of type 'reset-response"
  "visp_hand2eye_calibration/resetResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<reset-response>)))
  "Returns md5sum for a message object of type '<reset-response>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'reset-response)))
  "Returns md5sum for a message object of type 'reset-response"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<reset-response>)))
  "Returns full string definition for message of type '<reset-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'reset-response)))
  "Returns full string definition for message of type 'reset-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <reset-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <reset-response>))
  "Converts a ROS message object to a list"
  (cl:list 'reset-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'reset)))
  'reset-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'reset)))
  'reset-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'reset)))
  "Returns string type for a service object of type '<reset>"
  "visp_hand2eye_calibration/reset")