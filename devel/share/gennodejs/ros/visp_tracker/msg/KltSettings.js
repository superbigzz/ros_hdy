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

class KltSettings {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.max_features = null;
      this.window_size = null;
      this.quality = null;
      this.min_distance = null;
      this.harris = null;
      this.size_block = null;
      this.pyramid_lvl = null;
      this.mask_border = null;
    }
    else {
      if (initObj.hasOwnProperty('max_features')) {
        this.max_features = initObj.max_features
      }
      else {
        this.max_features = 0;
      }
      if (initObj.hasOwnProperty('window_size')) {
        this.window_size = initObj.window_size
      }
      else {
        this.window_size = 0;
      }
      if (initObj.hasOwnProperty('quality')) {
        this.quality = initObj.quality
      }
      else {
        this.quality = 0.0;
      }
      if (initObj.hasOwnProperty('min_distance')) {
        this.min_distance = initObj.min_distance
      }
      else {
        this.min_distance = 0.0;
      }
      if (initObj.hasOwnProperty('harris')) {
        this.harris = initObj.harris
      }
      else {
        this.harris = 0.0;
      }
      if (initObj.hasOwnProperty('size_block')) {
        this.size_block = initObj.size_block
      }
      else {
        this.size_block = 0;
      }
      if (initObj.hasOwnProperty('pyramid_lvl')) {
        this.pyramid_lvl = initObj.pyramid_lvl
      }
      else {
        this.pyramid_lvl = 0;
      }
      if (initObj.hasOwnProperty('mask_border')) {
        this.mask_border = initObj.mask_border
      }
      else {
        this.mask_border = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type KltSettings
    // Serialize message field [max_features]
    bufferOffset = _serializer.int64(obj.max_features, buffer, bufferOffset);
    // Serialize message field [window_size]
    bufferOffset = _serializer.int64(obj.window_size, buffer, bufferOffset);
    // Serialize message field [quality]
    bufferOffset = _serializer.float64(obj.quality, buffer, bufferOffset);
    // Serialize message field [min_distance]
    bufferOffset = _serializer.float64(obj.min_distance, buffer, bufferOffset);
    // Serialize message field [harris]
    bufferOffset = _serializer.float64(obj.harris, buffer, bufferOffset);
    // Serialize message field [size_block]
    bufferOffset = _serializer.int64(obj.size_block, buffer, bufferOffset);
    // Serialize message field [pyramid_lvl]
    bufferOffset = _serializer.int64(obj.pyramid_lvl, buffer, bufferOffset);
    // Serialize message field [mask_border]
    bufferOffset = _serializer.int64(obj.mask_border, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type KltSettings
    let len;
    let data = new KltSettings(null);
    // Deserialize message field [max_features]
    data.max_features = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [window_size]
    data.window_size = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [quality]
    data.quality = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [min_distance]
    data.min_distance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [harris]
    data.harris = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [size_block]
    data.size_block = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [pyramid_lvl]
    data.pyramid_lvl = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [mask_border]
    data.mask_border = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 64;
  }

  static datatype() {
    // Returns string type for a message object
    return 'visp_tracker/KltSettings';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7cd8ae2f3a31d26015e8c80e88eb027a';
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
    const resolved = new KltSettings(null);
    if (msg.max_features !== undefined) {
      resolved.max_features = msg.max_features;
    }
    else {
      resolved.max_features = 0
    }

    if (msg.window_size !== undefined) {
      resolved.window_size = msg.window_size;
    }
    else {
      resolved.window_size = 0
    }

    if (msg.quality !== undefined) {
      resolved.quality = msg.quality;
    }
    else {
      resolved.quality = 0.0
    }

    if (msg.min_distance !== undefined) {
      resolved.min_distance = msg.min_distance;
    }
    else {
      resolved.min_distance = 0.0
    }

    if (msg.harris !== undefined) {
      resolved.harris = msg.harris;
    }
    else {
      resolved.harris = 0.0
    }

    if (msg.size_block !== undefined) {
      resolved.size_block = msg.size_block;
    }
    else {
      resolved.size_block = 0
    }

    if (msg.pyramid_lvl !== undefined) {
      resolved.pyramid_lvl = msg.pyramid_lvl;
    }
    else {
      resolved.pyramid_lvl = 0
    }

    if (msg.mask_border !== undefined) {
      resolved.mask_border = msg.mask_border;
    }
    else {
      resolved.mask_border = 0
    }

    return resolved;
    }
};

module.exports = KltSettings;
