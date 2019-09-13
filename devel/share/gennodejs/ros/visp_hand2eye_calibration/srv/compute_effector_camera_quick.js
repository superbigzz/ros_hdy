// Auto-generated. Do not edit!

// (in-package visp_hand2eye_calibration.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let TransformArray = require('../msg/TransformArray.js');

//-----------------------------------------------------------

let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class compute_effector_camera_quickRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.camera_object = null;
      this.world_effector = null;
    }
    else {
      if (initObj.hasOwnProperty('camera_object')) {
        this.camera_object = initObj.camera_object
      }
      else {
        this.camera_object = new TransformArray();
      }
      if (initObj.hasOwnProperty('world_effector')) {
        this.world_effector = initObj.world_effector
      }
      else {
        this.world_effector = new TransformArray();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type compute_effector_camera_quickRequest
    // Serialize message field [camera_object]
    bufferOffset = TransformArray.serialize(obj.camera_object, buffer, bufferOffset);
    // Serialize message field [world_effector]
    bufferOffset = TransformArray.serialize(obj.world_effector, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type compute_effector_camera_quickRequest
    let len;
    let data = new compute_effector_camera_quickRequest(null);
    // Deserialize message field [camera_object]
    data.camera_object = TransformArray.deserialize(buffer, bufferOffset);
    // Deserialize message field [world_effector]
    data.world_effector = TransformArray.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += TransformArray.getMessageSize(object.camera_object);
    length += TransformArray.getMessageSize(object.world_effector);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'visp_hand2eye_calibration/compute_effector_camera_quickRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4ce42b1236ce32724031d598c2a332bf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    
    visp_hand2eye_calibration/TransformArray camera_object
    visp_hand2eye_calibration/TransformArray world_effector
    
    ================================================================================
    MSG: visp_hand2eye_calibration/TransformArray
    # An array of transforms with a header for global reference.
    
    Header header
    
    geometry_msgs/Transform[] transforms
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new compute_effector_camera_quickRequest(null);
    if (msg.camera_object !== undefined) {
      resolved.camera_object = TransformArray.Resolve(msg.camera_object)
    }
    else {
      resolved.camera_object = new TransformArray()
    }

    if (msg.world_effector !== undefined) {
      resolved.world_effector = TransformArray.Resolve(msg.world_effector)
    }
    else {
      resolved.world_effector = new TransformArray()
    }

    return resolved;
    }
};

class compute_effector_camera_quickResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.effector_camera = null;
    }
    else {
      if (initObj.hasOwnProperty('effector_camera')) {
        this.effector_camera = initObj.effector_camera
      }
      else {
        this.effector_camera = new geometry_msgs.msg.Transform();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type compute_effector_camera_quickResponse
    // Serialize message field [effector_camera]
    bufferOffset = geometry_msgs.msg.Transform.serialize(obj.effector_camera, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type compute_effector_camera_quickResponse
    let len;
    let data = new compute_effector_camera_quickResponse(null);
    // Deserialize message field [effector_camera]
    data.effector_camera = geometry_msgs.msg.Transform.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 56;
  }

  static datatype() {
    // Returns string type for a service object
    return 'visp_hand2eye_calibration/compute_effector_camera_quickResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e28a9ea34e6e135a6309cbdf6fb0ad0d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Transform effector_camera
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new compute_effector_camera_quickResponse(null);
    if (msg.effector_camera !== undefined) {
      resolved.effector_camera = geometry_msgs.msg.Transform.Resolve(msg.effector_camera)
    }
    else {
      resolved.effector_camera = new geometry_msgs.msg.Transform()
    }

    return resolved;
    }
};

module.exports = {
  Request: compute_effector_camera_quickRequest,
  Response: compute_effector_camera_quickResponse,
  md5sum() { return 'ac7e8b661c5bfedda75b54410a11cf73'; },
  datatype() { return 'visp_hand2eye_calibration/compute_effector_camera_quick'; }
};
