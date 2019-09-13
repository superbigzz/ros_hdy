// Auto-generated. Do not edit!

// (in-package visp_tracker.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let TrackerSettings = require('../msg/TrackerSettings.js');
let MovingEdgeSettings = require('../msg/MovingEdgeSettings.js');
let KltSettings = require('../msg/KltSettings.js');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class InitRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.initial_cMo = null;
      this.tracker_param = null;
      this.moving_edge = null;
      this.klt_param = null;
    }
    else {
      if (initObj.hasOwnProperty('initial_cMo')) {
        this.initial_cMo = initObj.initial_cMo
      }
      else {
        this.initial_cMo = new geometry_msgs.msg.Transform();
      }
      if (initObj.hasOwnProperty('tracker_param')) {
        this.tracker_param = initObj.tracker_param
      }
      else {
        this.tracker_param = new TrackerSettings();
      }
      if (initObj.hasOwnProperty('moving_edge')) {
        this.moving_edge = initObj.moving_edge
      }
      else {
        this.moving_edge = new MovingEdgeSettings();
      }
      if (initObj.hasOwnProperty('klt_param')) {
        this.klt_param = initObj.klt_param
      }
      else {
        this.klt_param = new KltSettings();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type InitRequest
    // Serialize message field [initial_cMo]
    bufferOffset = geometry_msgs.msg.Transform.serialize(obj.initial_cMo, buffer, bufferOffset);
    // Serialize message field [tracker_param]
    bufferOffset = TrackerSettings.serialize(obj.tracker_param, buffer, bufferOffset);
    // Serialize message field [moving_edge]
    bufferOffset = MovingEdgeSettings.serialize(obj.moving_edge, buffer, bufferOffset);
    // Serialize message field [klt_param]
    bufferOffset = KltSettings.serialize(obj.klt_param, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type InitRequest
    let len;
    let data = new InitRequest(null);
    // Deserialize message field [initial_cMo]
    data.initial_cMo = geometry_msgs.msg.Transform.deserialize(buffer, bufferOffset);
    // Deserialize message field [tracker_param]
    data.tracker_param = TrackerSettings.deserialize(buffer, bufferOffset);
    // Deserialize message field [moving_edge]
    data.moving_edge = MovingEdgeSettings.deserialize(buffer, bufferOffset);
    // Deserialize message field [klt_param]
    data.klt_param = KltSettings.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 200;
  }

  static datatype() {
    // Returns string type for a service object
    return 'visp_tracker/InitRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '72f45c4391731722797b61d639ff8889';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    
    
    
    
    
    
    
    geometry_msgs/Transform initial_cMo
    
    
    TrackerSettings tracker_param
    
    
    MovingEdgeSettings moving_edge
    
    
    KltSettings klt_param
    
    ================================================================================
    MSG: geometry_msgs/Transform
    # This represents the transform between two coordinate frames in free space.
    
    Vector3 translation
    Quaternion rotation
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    ================================================================================
    MSG: visp_tracker/TrackerSettings
    # This message contains tracking parameters.
    #
    # These parameters determine how precise, how fast and how
    # reliable will be the tracking.
    #
    # It should be tuned carefully and can be changed dynamically.
    #
    # For more details, see the ViSP documentation:
    # http://www.irisa.fr/lagadic/visp/publication.html
    
    # Common Tracker Parameters.
    float64 angle_appear    # Angle to test faces apparition
    float64 angle_disappear # Angle to test faces disparition
    
    
    ================================================================================
    MSG: visp_tracker/MovingEdgeSettings
    # This message contains tracking parameters.
    #
    # These parameters determine how precise, how fast and how
    # reliable will be the tracking.
    #
    # It should be tuned carefully and can be changed dynamically.
    #
    # For more details, see the ViSP documentation:
    # http://www.irisa.fr/lagadic/visp/publication.html
    
    
    # Moving edge parameters.
    
    int64 mask_size    # Mask size (in pixel) used to compute the image gradient
                       # and determine the object contour.
    		   # A larger mask size is better for larger images.
    		   # 3 pixels is enough for 640x480 images.
                       # Increasing this value makes the tracking slower.
    		   #
    		   # Caution: this value cannot be changed dynamically
    		   # without resetting the tracking.
    
    int64 range        # Maximum seek distance on both sides of the reference pixel.
          		   # It should match the maximum distance in pixel between
    		   # the current position of the feature projection and
    		   # its next position.
    		   # I.e. if the object moves fast and your tracking
    		   # frequency is low, this value should be increased.
                       # Increasing this value makes the tracking slower.
    
    float64 threshold  # Value used to determine if a moving edge is valid
    		   # or not.
    
    float64 mu1        # Minimum image contrast allowed to detect a contour.
    float64 mu2        # Maximum image contrast allowed to detect a contour.
    
    int64 sample_step   # Minimum distance in pixel between two
          		    # discretization points.
          		    # It avoids having too many discretization points when
    		    # the tracked object is far away (and its projection
    		    # in the image is small).
    		    # Increasing this value makes the tracking *faster*.
    
    int64 strip             # How many pixels are ignored around the borders.
    
    
    # Tracker parameters.
    
    float64 first_threshold # What proportion of points should be valid to
                            # acccept an initial pose.
    			# Value should be between 0 et 1.
    
    
    ================================================================================
    MSG: visp_tracker/KltSettings
    # This message contains tracking parameters.
    #
    # These parameters determine how precise, how fast and how
    # reliable will be the tracking.
    #
    # It should be tuned carefully and can be changed dynamically.
    #
    # For more details, see the ViSP documentation:
    # http://www.irisa.fr/lagadic/visp/publication.html
    
    # Klt Parameters.
    
    int64 max_features      # Maximum number of features
    int64 window_size       # Window size
    float64 quality         # Quality of the tracker
    float64 min_distance      # Minimum distance betwenn two points
    float64 harris          # Harris free parameters
    int64 size_block        # Block size
    int64 pyramid_lvl       # Pyramid levels
    int64 mask_border       # Mask Border
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new InitRequest(null);
    if (msg.initial_cMo !== undefined) {
      resolved.initial_cMo = geometry_msgs.msg.Transform.Resolve(msg.initial_cMo)
    }
    else {
      resolved.initial_cMo = new geometry_msgs.msg.Transform()
    }

    if (msg.tracker_param !== undefined) {
      resolved.tracker_param = TrackerSettings.Resolve(msg.tracker_param)
    }
    else {
      resolved.tracker_param = new TrackerSettings()
    }

    if (msg.moving_edge !== undefined) {
      resolved.moving_edge = MovingEdgeSettings.Resolve(msg.moving_edge)
    }
    else {
      resolved.moving_edge = new MovingEdgeSettings()
    }

    if (msg.klt_param !== undefined) {
      resolved.klt_param = KltSettings.Resolve(msg.klt_param)
    }
    else {
      resolved.klt_param = new KltSettings()
    }

    return resolved;
    }
};

class InitResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.initialization_succeed = null;
    }
    else {
      if (initObj.hasOwnProperty('initialization_succeed')) {
        this.initialization_succeed = initObj.initialization_succeed
      }
      else {
        this.initialization_succeed = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type InitResponse
    // Serialize message field [initialization_succeed]
    bufferOffset = _serializer.bool(obj.initialization_succeed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type InitResponse
    let len;
    let data = new InitResponse(null);
    // Deserialize message field [initialization_succeed]
    data.initialization_succeed = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'visp_tracker/InitResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8e1a436e960986e0760f2970d0c88bf4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    bool initialization_succeed
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new InitResponse(null);
    if (msg.initialization_succeed !== undefined) {
      resolved.initialization_succeed = msg.initialization_succeed;
    }
    else {
      resolved.initialization_succeed = false
    }

    return resolved;
    }
};

module.exports = {
  Request: InitRequest,
  Response: InitResponse,
  md5sum() { return '99679e33547ba56c949bb75d2a309602'; },
  datatype() { return 'visp_tracker/Init'; }
};
