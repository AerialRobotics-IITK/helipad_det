// Auto-generated. Do not edit!

// (in-package mav_utils_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let RouterData = require('./RouterData.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class RouterInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.object_id = null;
      this.router_data = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('object_id')) {
        this.object_id = initObj.object_id
      }
      else {
        this.object_id = [];
      }
      if (initObj.hasOwnProperty('router_data')) {
        this.router_data = initObj.router_data
      }
      else {
        this.router_data = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RouterInfo
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [object_id]
    bufferOffset = _arraySerializer.int16(obj.object_id, buffer, bufferOffset, null);
    // Serialize message field [router_data]
    // Serialize the length for message field [router_data]
    bufferOffset = _serializer.uint32(obj.router_data.length, buffer, bufferOffset);
    obj.router_data.forEach((val) => {
      bufferOffset = RouterData.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RouterInfo
    let len;
    let data = new RouterInfo(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [object_id]
    data.object_id = _arrayDeserializer.int16(buffer, bufferOffset, null)
    // Deserialize message field [router_data]
    // Deserialize array length for message field [router_data]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.router_data = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.router_data[i] = RouterData.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 2 * object.object_id.length;
    length += 26 * object.router_data.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mav_utils_msgs/RouterInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6ff2a8e53da5af51cb59d4d23d6612c0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    int16[] object_id
    RouterData[] router_data
    
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
    string frame_id
    
    ================================================================================
    MSG: mav_utils_msgs/RouterData
    int16 id
    geometry_msgs/Point position
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RouterInfo(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.object_id !== undefined) {
      resolved.object_id = msg.object_id;
    }
    else {
      resolved.object_id = []
    }

    if (msg.router_data !== undefined) {
      resolved.router_data = new Array(msg.router_data.length);
      for (let i = 0; i < resolved.router_data.length; ++i) {
        resolved.router_data[i] = RouterData.Resolve(msg.router_data[i]);
      }
    }
    else {
      resolved.router_data = []
    }

    return resolved;
    }
};

module.exports = RouterInfo;
