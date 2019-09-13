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

class KltPoint {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.i = null;
      this.j = null;
      this.id = null;
    }
    else {
      if (initObj.hasOwnProperty('i')) {
        this.i = initObj.i
      }
      else {
        this.i = 0.0;
      }
      if (initObj.hasOwnProperty('j')) {
        this.j = initObj.j
      }
      else {
        this.j = 0.0;
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type KltPoint
    // Serialize message field [i]
    bufferOffset = _serializer.float64(obj.i, buffer, bufferOffset);
    // Serialize message field [j]
    bufferOffset = _serializer.float64(obj.j, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.int32(obj.id, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type KltPoint
    let len;
    let data = new KltPoint(null);
    // Deserialize message field [i]
    data.i = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [j]
    data.j = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'visp_tracker/KltPoint';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6014cf727908e3e35d0048962e94796f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # KLT point position.
    
    float64 i      # i position in the image
    float64 j      # j position in the image
    int32   id     # Point id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new KltPoint(null);
    if (msg.i !== undefined) {
      resolved.i = msg.i;
    }
    else {
      resolved.i = 0.0
    }

    if (msg.j !== undefined) {
      resolved.j = msg.j;
    }
    else {
      resolved.j = 0.0
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    return resolved;
    }
};

module.exports = KltPoint;
