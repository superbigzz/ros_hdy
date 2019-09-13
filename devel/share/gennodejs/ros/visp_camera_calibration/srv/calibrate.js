// Auto-generated. Do not edit!

// (in-package visp_camera_calibration.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class calibrateRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.method = null;
      this.sample_width = null;
      this.sample_height = null;
    }
    else {
      if (initObj.hasOwnProperty('method')) {
        this.method = initObj.method
      }
      else {
        this.method = 0;
      }
      if (initObj.hasOwnProperty('sample_width')) {
        this.sample_width = initObj.sample_width
      }
      else {
        this.sample_width = 0;
      }
      if (initObj.hasOwnProperty('sample_height')) {
        this.sample_height = initObj.sample_height
      }
      else {
        this.sample_height = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type calibrateRequest
    // Serialize message field [method]
    bufferOffset = _serializer.int32(obj.method, buffer, bufferOffset);
    // Serialize message field [sample_width]
    bufferOffset = _serializer.int32(obj.sample_width, buffer, bufferOffset);
    // Serialize message field [sample_height]
    bufferOffset = _serializer.int32(obj.sample_height, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type calibrateRequest
    let len;
    let data = new calibrateRequest(null);
    // Deserialize message field [method]
    data.method = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [sample_width]
    data.sample_width = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [sample_height]
    data.sample_height = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'visp_camera_calibration/calibrateRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7b57c459896a8f1f8df45a385acfc123';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 method
    int32 sample_width
    int32 sample_height
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new calibrateRequest(null);
    if (msg.method !== undefined) {
      resolved.method = msg.method;
    }
    else {
      resolved.method = 0
    }

    if (msg.sample_width !== undefined) {
      resolved.sample_width = msg.sample_width;
    }
    else {
      resolved.sample_width = 0
    }

    if (msg.sample_height !== undefined) {
      resolved.sample_height = msg.sample_height;
    }
    else {
      resolved.sample_height = 0
    }

    return resolved;
    }
};

class calibrateResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.stdDevErrs = null;
    }
    else {
      if (initObj.hasOwnProperty('stdDevErrs')) {
        this.stdDevErrs = initObj.stdDevErrs
      }
      else {
        this.stdDevErrs = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type calibrateResponse
    // Serialize message field [stdDevErrs]
    bufferOffset = _arraySerializer.float64(obj.stdDevErrs, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type calibrateResponse
    let len;
    let data = new calibrateResponse(null);
    // Deserialize message field [stdDevErrs]
    data.stdDevErrs = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.stdDevErrs.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'visp_camera_calibration/calibrateResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cd6d27af348dbd9b7530b010497f18b0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] stdDevErrs
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new calibrateResponse(null);
    if (msg.stdDevErrs !== undefined) {
      resolved.stdDevErrs = msg.stdDevErrs;
    }
    else {
      resolved.stdDevErrs = []
    }

    return resolved;
    }
};

module.exports = {
  Request: calibrateRequest,
  Response: calibrateResponse,
  md5sum() { return '30e17d7747033ddb69c9980395e78d44'; },
  datatype() { return 'visp_camera_calibration/calibrate'; }
};
