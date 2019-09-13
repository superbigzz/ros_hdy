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

class TrackerSettings {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.angle_appear = null;
      this.angle_disappear = null;
    }
    else {
      if (initObj.hasOwnProperty('angle_appear')) {
        this.angle_appear = initObj.angle_appear
      }
      else {
        this.angle_appear = 0.0;
      }
      if (initObj.hasOwnProperty('angle_disappear')) {
        this.angle_disappear = initObj.angle_disappear
      }
      else {
        this.angle_disappear = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TrackerSettings
    // Serialize message field [angle_appear]
    bufferOffset = _serializer.float64(obj.angle_appear, buffer, bufferOffset);
    // Serialize message field [angle_disappear]
    bufferOffset = _serializer.float64(obj.angle_disappear, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TrackerSettings
    let len;
    let data = new TrackerSettings(null);
    // Deserialize message field [angle_appear]
    data.angle_appear = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [angle_disappear]
    data.angle_disappear = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'visp_tracker/TrackerSettings';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3af7f3dad594635cfe340be2c0b60a68';
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
    
    # Common Tracker Parameters.
    float64 angle_appear    # Angle to test faces apparition
    float64 angle_disappear # Angle to test faces disparition
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TrackerSettings(null);
    if (msg.angle_appear !== undefined) {
      resolved.angle_appear = msg.angle_appear;
    }
    else {
      resolved.angle_appear = 0.0
    }

    if (msg.angle_disappear !== undefined) {
      resolved.angle_disappear = msg.angle_disappear;
    }
    else {
      resolved.angle_disappear = 0.0
    }

    return resolved;
    }
};

module.exports = TrackerSettings;
