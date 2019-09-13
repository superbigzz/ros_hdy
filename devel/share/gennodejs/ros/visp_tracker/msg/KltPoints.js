// Auto-generated. Do not edit!

// (in-package visp_tracker.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let KltPoint = require('./KltPoint.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class KltPoints {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.klt_points_positions = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('klt_points_positions')) {
        this.klt_points_positions = initObj.klt_points_positions
      }
      else {
        this.klt_points_positions = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type KltPoints
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [klt_points_positions]
    // Serialize the length for message field [klt_points_positions]
    bufferOffset = _serializer.uint32(obj.klt_points_positions.length, buffer, bufferOffset);
    obj.klt_points_positions.forEach((val) => {
      bufferOffset = KltPoint.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type KltPoints
    let len;
    let data = new KltPoints(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [klt_points_positions]
    // Deserialize array length for message field [klt_points_positions]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.klt_points_positions = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.klt_points_positions[i] = KltPoint.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 20 * object.klt_points_positions.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'visp_tracker/KltPoints';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '681548d0f72044b7f086e3985d86f93c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Stamped list of KLT points positions.
    #
    # KLT points positions associated with a particular timestamp.
    # Used by the viewer to display KLT points positions and allow
    # tracking debug.
    
    Header header                        # Header (required for synchronization).
    KltPoint[] klt_points_positions      # List of KLT points positions.
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    # 0: no frame
    # 1: global frame
    string frame_id
    
    ================================================================================
    MSG: visp_tracker/KltPoint
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
    const resolved = new KltPoints(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.klt_points_positions !== undefined) {
      resolved.klt_points_positions = new Array(msg.klt_points_positions.length);
      for (let i = 0; i < resolved.klt_points_positions.length; ++i) {
        resolved.klt_points_positions[i] = KltPoint.Resolve(msg.klt_points_positions[i]);
      }
    }
    else {
      resolved.klt_points_positions = []
    }

    return resolved;
    }
};

module.exports = KltPoints;
