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

class MovingEdgeSite {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.suppress = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('suppress')) {
        this.suppress = initObj.suppress
      }
      else {
        this.suppress = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MovingEdgeSite
    // Serialize message field [x]
    bufferOffset = _serializer.float64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float64(obj.y, buffer, bufferOffset);
    // Serialize message field [suppress]
    bufferOffset = _serializer.int32(obj.suppress, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MovingEdgeSite
    let len;
    let data = new MovingEdgeSite(null);
    // Deserialize message field [x]
    data.x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [suppress]
    data.suppress = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'visp_tracker/MovingEdgeSite';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd67448def98304944978d0ca12803af8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Moving edge position.
    
    float64 x      # X position in the image
    float64 y      # Y position in the image
    int32 suppress # Is the moving edge valid?
                   # - 0:   yes
    	       # - 1:   no, constrast check has failed.
    	       # - 2:   no, threshold check has failed.
    	       # - 3:   no, M-estimator check has failed.
    	       # - >=4: no, undocumented reason.
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MovingEdgeSite(null);
    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.suppress !== undefined) {
      resolved.suppress = msg.suppress;
    }
    else {
      resolved.suppress = 0
    }

    return resolved;
    }
};

module.exports = MovingEdgeSite;
