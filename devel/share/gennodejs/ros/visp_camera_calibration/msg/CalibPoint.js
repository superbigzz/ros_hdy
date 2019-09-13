// Auto-generated. Do not edit!

// (in-package visp_camera_calibration.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class CalibPoint {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.i = null;
      this.j = null;
      this.X = null;
      this.Y = null;
      this.Z = null;
    }
    else {
      if (initObj.hasOwnProperty('i')) {
        this.i = initObj.i
      }
      else {
        this.i = 0;
      }
      if (initObj.hasOwnProperty('j')) {
        this.j = initObj.j
      }
      else {
        this.j = 0;
      }
      if (initObj.hasOwnProperty('X')) {
        this.X = initObj.X
      }
      else {
        this.X = 0.0;
      }
      if (initObj.hasOwnProperty('Y')) {
        this.Y = initObj.Y
      }
      else {
        this.Y = 0.0;
      }
      if (initObj.hasOwnProperty('Z')) {
        this.Z = initObj.Z
      }
      else {
        this.Z = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CalibPoint
    // Serialize message field [i]
    bufferOffset = _serializer.int32(obj.i, buffer, bufferOffset);
    // Serialize message field [j]
    bufferOffset = _serializer.int32(obj.j, buffer, bufferOffset);
    // Serialize message field [X]
    bufferOffset = _serializer.float64(obj.X, buffer, bufferOffset);
    // Serialize message field [Y]
    bufferOffset = _serializer.float64(obj.Y, buffer, bufferOffset);
    // Serialize message field [Z]
    bufferOffset = _serializer.float64(obj.Z, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CalibPoint
    let len;
    let data = new CalibPoint(null);
    // Deserialize message field [i]
    data.i = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [j]
    data.j = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [X]
    data.X = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Y]
    data.Y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Z]
    data.Z = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'visp_camera_calibration/CalibPoint';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9b9d41ff2127a593c07cec2a11858ac5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # a vpPoint
    
    int32 i
    int32 j
    float64 X
    float64 Y
    float64 Z
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CalibPoint(null);
    if (msg.i !== undefined) {
      resolved.i = msg.i;
    }
    else {
      resolved.i = 0
    }

    if (msg.j !== undefined) {
      resolved.j = msg.j;
    }
    else {
      resolved.j = 0
    }

    if (msg.X !== undefined) {
      resolved.X = msg.X;
    }
    else {
      resolved.X = 0.0
    }

    if (msg.Y !== undefined) {
      resolved.Y = msg.Y;
    }
    else {
      resolved.Y = 0.0
    }

    if (msg.Z !== undefined) {
      resolved.Z = msg.Z;
    }
    else {
      resolved.Z = 0.0
    }

    return resolved;
    }
};

module.exports = CalibPoint;
