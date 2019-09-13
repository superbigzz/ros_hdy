// Auto-generated. Do not edit!

// (in-package visp_tracker.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let MovingEdgeSite = require('./MovingEdgeSite.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class MovingEdgeSites {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.moving_edge_sites = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('moving_edge_sites')) {
        this.moving_edge_sites = initObj.moving_edge_sites
      }
      else {
        this.moving_edge_sites = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MovingEdgeSites
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [moving_edge_sites]
    // Serialize the length for message field [moving_edge_sites]
    bufferOffset = _serializer.uint32(obj.moving_edge_sites.length, buffer, bufferOffset);
    obj.moving_edge_sites.forEach((val) => {
      bufferOffset = MovingEdgeSite.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MovingEdgeSites
    let len;
    let data = new MovingEdgeSites(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [moving_edge_sites]
    // Deserialize array length for message field [moving_edge_sites]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.moving_edge_sites = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.moving_edge_sites[i] = MovingEdgeSite.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 20 * object.moving_edge_sites.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'visp_tracker/MovingEdgeSites';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5293e8601467590a0dabbb34da47310c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Stamped list of moving edge positions.
    #
    # Moving edge positions associated with a particular timestamp.
    # Used by the viewer to display moving edge positions and allow
    # tracking debug.
    
    Header header                       # Header (required for synchronization).
    MovingEdgeSite[] moving_edge_sites  # List of moving dge sites (i.e. positions).
    
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
    MSG: visp_tracker/MovingEdgeSite
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
    const resolved = new MovingEdgeSites(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.moving_edge_sites !== undefined) {
      resolved.moving_edge_sites = new Array(msg.moving_edge_sites.length);
      for (let i = 0; i < resolved.moving_edge_sites.length; ++i) {
        resolved.moving_edge_sites[i] = MovingEdgeSite.Resolve(msg.moving_edge_sites[i]);
      }
    }
    else {
      resolved.moving_edge_sites = []
    }

    return resolved;
    }
};

module.exports = MovingEdgeSites;
