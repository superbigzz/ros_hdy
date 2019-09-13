; Auto-generated. Do not edit!


(cl:in-package visp_tracker-srv)


;//! \htmlinclude Init-request.msg.html

(cl:defclass <Init-request> (roslisp-msg-protocol:ros-message)
  ((initial_cMo
    :reader initial_cMo
    :initarg :initial_cMo
    :type geometry_msgs-msg:Transform
    :initform (cl:make-instance 'geometry_msgs-msg:Transform))
   (tracker_param
    :reader tracker_param
    :initarg :tracker_param
    :type visp_tracker-msg:TrackerSettings
    :initform (cl:make-instance 'visp_tracker-msg:TrackerSettings))
   (moving_edge
    :reader moving_edge
    :initarg :moving_edge
    :type visp_tracker-msg:MovingEdgeSettings
    :initform (cl:make-instance 'visp_tracker-msg:MovingEdgeSettings))
   (klt_param
    :reader klt_param
    :initarg :klt_param
    :type visp_tracker-msg:KltSettings
    :initform (cl:make-instance 'visp_tracker-msg:KltSettings)))
)

(cl:defclass Init-request (<Init-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Init-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Init-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name visp_tracker-srv:<Init-request> is deprecated: use visp_tracker-srv:Init-request instead.")))

(cl:ensure-generic-function 'initial_cMo-val :lambda-list '(m))
(cl:defmethod initial_cMo-val ((m <Init-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-srv:initial_cMo-val is deprecated.  Use visp_tracker-srv:initial_cMo instead.")
  (initial_cMo m))

(cl:ensure-generic-function 'tracker_param-val :lambda-list '(m))
(cl:defmethod tracker_param-val ((m <Init-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-srv:tracker_param-val is deprecated.  Use visp_tracker-srv:tracker_param instead.")
  (tracker_param m))

(cl:ensure-generic-function 'moving_edge-val :lambda-list '(m))
(cl:defmethod moving_edge-val ((m <Init-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-srv:moving_edge-val is deprecated.  Use visp_tracker-srv:moving_edge instead.")
  (moving_edge m))

(cl:ensure-generic-function 'klt_param-val :lambda-list '(m))
(cl:defmethod klt_param-val ((m <Init-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-srv:klt_param-val is deprecated.  Use visp_tracker-srv:klt_param instead.")
  (klt_param m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Init-request>) ostream)
  "Serializes a message object of type '<Init-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'initial_cMo) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'tracker_param) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'moving_edge) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'klt_param) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Init-request>) istream)
  "Deserializes a message object of type '<Init-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'initial_cMo) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'tracker_param) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'moving_edge) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'klt_param) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Init-request>)))
  "Returns string type for a service object of type '<Init-request>"
  "visp_tracker/InitRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Init-request)))
  "Returns string type for a service object of type 'Init-request"
  "visp_tracker/InitRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Init-request>)))
  "Returns md5sum for a message object of type '<Init-request>"
  "99679e33547ba56c949bb75d2a309602")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Init-request)))
  "Returns md5sum for a message object of type 'Init-request"
  "99679e33547ba56c949bb75d2a309602")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Init-request>)))
  "Returns full string definition for message of type '<Init-request>"
  (cl:format cl:nil "~%~%~%~%~%~%~%~%~%geometry_msgs/Transform initial_cMo~%~%~%TrackerSettings tracker_param~%~%~%MovingEdgeSettings moving_edge~%~%~%KltSettings klt_param~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: visp_tracker/TrackerSettings~%# This message contains tracking parameters.~%#~%# These parameters determine how precise, how fast and how~%# reliable will be the tracking.~%#~%# It should be tuned carefully and can be changed dynamically.~%#~%# For more details, see the ViSP documentation:~%# http://www.irisa.fr/lagadic/visp/publication.html~%~%# Common Tracker Parameters.~%float64 angle_appear    # Angle to test faces apparition~%float64 angle_disappear # Angle to test faces disparition~%~%~%================================================================================~%MSG: visp_tracker/MovingEdgeSettings~%# This message contains tracking parameters.~%#~%# These parameters determine how precise, how fast and how~%# reliable will be the tracking.~%#~%# It should be tuned carefully and can be changed dynamically.~%#~%# For more details, see the ViSP documentation:~%# http://www.irisa.fr/lagadic/visp/publication.html~%~%~%# Moving edge parameters.~%~%int64 mask_size    # Mask size (in pixel) used to compute the image gradient~%                   # and determine the object contour.~%		   # A larger mask size is better for larger images.~%		   # 3 pixels is enough for 640x480 images.~%                   # Increasing this value makes the tracking slower.~%		   #~%		   # Caution: this value cannot be changed dynamically~%		   # without resetting the tracking.~%~%int64 range        # Maximum seek distance on both sides of the reference pixel.~%      		   # It should match the maximum distance in pixel between~%		   # the current position of the feature projection and~%		   # its next position.~%		   # I.e. if the object moves fast and your tracking~%		   # frequency is low, this value should be increased.~%                   # Increasing this value makes the tracking slower.~%~%float64 threshold  # Value used to determine if a moving edge is valid~%		   # or not.~%~%float64 mu1        # Minimum image contrast allowed to detect a contour.~%float64 mu2        # Maximum image contrast allowed to detect a contour.~%~%int64 sample_step   # Minimum distance in pixel between two~%      		    # discretization points.~%      		    # It avoids having too many discretization points when~%		    # the tracked object is far away (and its projection~%		    # in the image is small).~%		    # Increasing this value makes the tracking *faster*.~%~%int64 strip             # How many pixels are ignored around the borders.~%~%~%# Tracker parameters.~%~%float64 first_threshold # What proportion of points should be valid to~%                        # acccept an initial pose.~%			# Value should be between 0 et 1.~%~%~%================================================================================~%MSG: visp_tracker/KltSettings~%# This message contains tracking parameters.~%#~%# These parameters determine how precise, how fast and how~%# reliable will be the tracking.~%#~%# It should be tuned carefully and can be changed dynamically.~%#~%# For more details, see the ViSP documentation:~%# http://www.irisa.fr/lagadic/visp/publication.html~%~%# Klt Parameters.~%~%int64 max_features      # Maximum number of features~%int64 window_size       # Window size~%float64 quality         # Quality of the tracker~%float64 min_distance      # Minimum distance betwenn two points~%float64 harris          # Harris free parameters~%int64 size_block        # Block size~%int64 pyramid_lvl       # Pyramid levels~%int64 mask_border       # Mask Border~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Init-request)))
  "Returns full string definition for message of type 'Init-request"
  (cl:format cl:nil "~%~%~%~%~%~%~%~%~%geometry_msgs/Transform initial_cMo~%~%~%TrackerSettings tracker_param~%~%~%MovingEdgeSettings moving_edge~%~%~%KltSettings klt_param~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: visp_tracker/TrackerSettings~%# This message contains tracking parameters.~%#~%# These parameters determine how precise, how fast and how~%# reliable will be the tracking.~%#~%# It should be tuned carefully and can be changed dynamically.~%#~%# For more details, see the ViSP documentation:~%# http://www.irisa.fr/lagadic/visp/publication.html~%~%# Common Tracker Parameters.~%float64 angle_appear    # Angle to test faces apparition~%float64 angle_disappear # Angle to test faces disparition~%~%~%================================================================================~%MSG: visp_tracker/MovingEdgeSettings~%# This message contains tracking parameters.~%#~%# These parameters determine how precise, how fast and how~%# reliable will be the tracking.~%#~%# It should be tuned carefully and can be changed dynamically.~%#~%# For more details, see the ViSP documentation:~%# http://www.irisa.fr/lagadic/visp/publication.html~%~%~%# Moving edge parameters.~%~%int64 mask_size    # Mask size (in pixel) used to compute the image gradient~%                   # and determine the object contour.~%		   # A larger mask size is better for larger images.~%		   # 3 pixels is enough for 640x480 images.~%                   # Increasing this value makes the tracking slower.~%		   #~%		   # Caution: this value cannot be changed dynamically~%		   # without resetting the tracking.~%~%int64 range        # Maximum seek distance on both sides of the reference pixel.~%      		   # It should match the maximum distance in pixel between~%		   # the current position of the feature projection and~%		   # its next position.~%		   # I.e. if the object moves fast and your tracking~%		   # frequency is low, this value should be increased.~%                   # Increasing this value makes the tracking slower.~%~%float64 threshold  # Value used to determine if a moving edge is valid~%		   # or not.~%~%float64 mu1        # Minimum image contrast allowed to detect a contour.~%float64 mu2        # Maximum image contrast allowed to detect a contour.~%~%int64 sample_step   # Minimum distance in pixel between two~%      		    # discretization points.~%      		    # It avoids having too many discretization points when~%		    # the tracked object is far away (and its projection~%		    # in the image is small).~%		    # Increasing this value makes the tracking *faster*.~%~%int64 strip             # How many pixels are ignored around the borders.~%~%~%# Tracker parameters.~%~%float64 first_threshold # What proportion of points should be valid to~%                        # acccept an initial pose.~%			# Value should be between 0 et 1.~%~%~%================================================================================~%MSG: visp_tracker/KltSettings~%# This message contains tracking parameters.~%#~%# These parameters determine how precise, how fast and how~%# reliable will be the tracking.~%#~%# It should be tuned carefully and can be changed dynamically.~%#~%# For more details, see the ViSP documentation:~%# http://www.irisa.fr/lagadic/visp/publication.html~%~%# Klt Parameters.~%~%int64 max_features      # Maximum number of features~%int64 window_size       # Window size~%float64 quality         # Quality of the tracker~%float64 min_distance      # Minimum distance betwenn two points~%float64 harris          # Harris free parameters~%int64 size_block        # Block size~%int64 pyramid_lvl       # Pyramid levels~%int64 mask_border       # Mask Border~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Init-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'initial_cMo))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'tracker_param))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'moving_edge))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'klt_param))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Init-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Init-request
    (cl:cons ':initial_cMo (initial_cMo msg))
    (cl:cons ':tracker_param (tracker_param msg))
    (cl:cons ':moving_edge (moving_edge msg))
    (cl:cons ':klt_param (klt_param msg))
))
;//! \htmlinclude Init-response.msg.html

(cl:defclass <Init-response> (roslisp-msg-protocol:ros-message)
  ((initialization_succeed
    :reader initialization_succeed
    :initarg :initialization_succeed
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Init-response (<Init-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Init-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Init-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name visp_tracker-srv:<Init-response> is deprecated: use visp_tracker-srv:Init-response instead.")))

(cl:ensure-generic-function 'initialization_succeed-val :lambda-list '(m))
(cl:defmethod initialization_succeed-val ((m <Init-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_tracker-srv:initialization_succeed-val is deprecated.  Use visp_tracker-srv:initialization_succeed instead.")
  (initialization_succeed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Init-response>) ostream)
  "Serializes a message object of type '<Init-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'initialization_succeed) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Init-response>) istream)
  "Deserializes a message object of type '<Init-response>"
    (cl:setf (cl:slot-value msg 'initialization_succeed) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Init-response>)))
  "Returns string type for a service object of type '<Init-response>"
  "visp_tracker/InitResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Init-response)))
  "Returns string type for a service object of type 'Init-response"
  "visp_tracker/InitResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Init-response>)))
  "Returns md5sum for a message object of type '<Init-response>"
  "99679e33547ba56c949bb75d2a309602")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Init-response)))
  "Returns md5sum for a message object of type 'Init-response"
  "99679e33547ba56c949bb75d2a309602")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Init-response>)))
  "Returns full string definition for message of type '<Init-response>"
  (cl:format cl:nil "~%bool initialization_succeed~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Init-response)))
  "Returns full string definition for message of type 'Init-response"
  (cl:format cl:nil "~%bool initialization_succeed~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Init-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Init-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Init-response
    (cl:cons ':initialization_succeed (initialization_succeed msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Init)))
  'Init-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Init)))
  'Init-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Init)))
  "Returns string type for a service object of type '<Init>"
  "visp_tracker/Init")