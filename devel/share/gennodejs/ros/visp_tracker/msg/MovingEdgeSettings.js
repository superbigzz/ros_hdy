// Auto-generated. Do not edit!

// (in-package visp_tracker.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class MovingEdgeSettings {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mask_size = null;
      this.range = null;
      this.threshold = null;
      this.mu1 = null;
      this.mu2 = null;
      this.sample_step = null;
      this.strip = null;
      this.first_threshold = null;
    }
    else {
      if (initObj.hasOwnProperty('mask_size')) {
        this.mask_size = initObj.mask_size
      }
      else {
        this.mask_size = 0;
      }
      if (initObj.hasOwnProperty('range')) {
        this.range = initObj.range
      }
      else {
        this.range = 0;
      }
      if (initObj.hasOwnProperty('threshold')) {
        this.threshold = initObj.threshold
      }
      else {
        this.threshold = 0.0;
      }
      if (initObj.hasOwnProperty('mu1')) {
        this.mu1 = initObj.mu1
      }
      else {
        this.mu1 = 0.0;
      }
      if (initObj.hasOwnProperty('mu2')) {
        this.mu2 = initObj.mu2
      }
      else {
        this.mu2 = 0.0;
      }
      if (initObj.hasOwnProperty('sample_step')) {
        this.sample_step = initObj.sample_step
      }
      else {
        this.sample_step = 0;
      }
      if (initObj.hasOwnProperty('strip')) {
        this.strip = initObj.strip
      }
      else {
        this.strip = 0;
      }
      if (initObj.hasOwnProperty('first_threshold')) {
        this.first_threshold = initObj.first_threshold
      }
      else {
        this.first_threshold = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MovingEdgeSettings
    // Serialize message field [mask_size]
    bufferOffset = _serializer.int64(obj.mask_size, buffer, bufferOffset);
    // Serialize message field [range]
    bufferOffset = _serializer.int64(obj.range, buffer, bufferOffset);
    // Serialize message field [threshold]
    bufferOffset = _serializer.float64(obj.threshold, buffer, bufferOffset);
    // Serialize message field [mu1]
    bufferOffset = _serializer.float64(obj.mu1, buffer, bufferOffset);
    // Serialize message field [mu2]
    bufferOffset = _serializer.float64(obj.mu2, buffer, bufferOffset);
    // Serialize message field [sample_step]
    bufferOffset = _serializer.int64(obj.sample_step, buffer, bufferOffset);
    // Serialize message field [strip]
    bufferOffset = _serializer.int64(obj.strip, buffer, bufferOffset);
    // Serialize message field [first_threshold]
    bufferOffset = _serializer.float64(obj.first_threshold, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MovingEdgeSettings
    let len;
    let data = new MovingEdgeSettings(null);
    // Deserialize message field [mask_size]
    data.mask_size = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [range]
    data.range = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [threshold]
    data.threshold = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [mu1]
    data.mu1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [mu2]
    data.mu2 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [sample_step]
    data.sample_step = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [strip]
    data.strip = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [first_threshold]
    data.first_threshold = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 64;
  }

  static datatype() {
    // Returns string type for a message object
    return 'visp_tracker/MovingEdgeSettings';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4e8f98b7dec6ffa099529044b3472486';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MovingEdgeSettings(null);
    if (msg.mask_size !== undefined) {
      resolved.mask_size = msg.mask_size;
    }
    else {
      resolved.mask_size = 0
    }

    if (msg.range !== undefined) {
      resolved.range = msg.range;
    }
    else {
      resolved.range = 0
    }

    if (msg.threshold !== undefined) {
      resolved.threshold = msg.threshold;
    }
    else {
      resolved.threshold = 0.0
    }

    if (msg.mu1 !== undefined) {
      resolved.mu1 = msg.mu1;
    }
    else {
      resolved.mu1 = 0.0
    }

    if (msg.mu2 !== undefined) {
      resolved.mu2 = msg.mu2;
    }
    else {
      resolved.mu2 = 0.0
    }

    if (msg.sample_step !== undefined) {
      resolved.sample_step = msg.sample_step;
    }
    else {
      resolved.sample_step = 0
    }

    if (msg.strip !== undefined) {
      resolved.strip = msg.strip;
    }
    else {
      resolved.strip = 0
    }

    if (msg.first_threshold !== undefined) {
      resolved.first_threshold = msg.first_threshold;
    }
    else {
      resolved.first_threshold = 0.0
    }

    return resolved;
    }
};

module.exports = MovingEdgeSettings;
