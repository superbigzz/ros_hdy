// Auto-generated. Do not edit!

// (in-package visp_hand2eye_calibration.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class compute_effector_cameraRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type compute_effector_cameraRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type compute_effector_cameraRequest
    let len;
    let data = new compute_effector_cameraRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'visp_hand2eye_calibration/compute_effector_cameraRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new compute_effector_cameraRequest(null);
    return resolved;
    }
};

class compute_effector_cameraResponse {
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
    // Serializes a message object of type compute_effector_cameraResponse
    // Serialize message field [effector_camera]
    bufferOffset = geometry_msgs.msg.Transform.serialize(obj.effector_camera, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type compute_effector_cameraResponse
    let len;
    let data = new compute_effector_cameraResponse(null);
    // Deserialize message field [effector_camera]
    data.effector_camera = geometry_msgs.msg.Transform.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 56;
  }

  static datatype() {
    // Returns string type for a service object
    return 'visp_hand2eye_calibration/compute_effector_cameraResponse';
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
    const resolved = new compute_effector_cameraResponse(null);
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
  Request: compute_effector_cameraRequest,
  Response: compute_effector_cameraResponse,
  md5sum() { return 'e28a9ea34e6e135a6309cbdf6fb0ad0d'; },
  datatype() { return 'visp_hand2eye_calibration/compute_effector_camera'; }
};
