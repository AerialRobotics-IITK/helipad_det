// Auto-generated. Do not edit!

// (in-package mav_utils_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let BBPose = require('./BBPose.js');

//-----------------------------------------------------------

class BBPoses {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.stamp = null;
      this.imageID = null;
      this.object_poses = null;
    }
    else {
      if (initObj.hasOwnProperty('stamp')) {
        this.stamp = initObj.stamp
      }
      else {
        this.stamp = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('imageID')) {
        this.imageID = initObj.imageID
      }
      else {
        this.imageID = 0;
      }
      if (initObj.hasOwnProperty('object_poses')) {
        this.object_poses = initObj.object_poses
      }
      else {
        this.object_poses = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BBPoses
    // Serialize message field [stamp]
    bufferOffset = _serializer.time(obj.stamp, buffer, bufferOffset);
    // Serialize message field [imageID]
    bufferOffset = _serializer.int32(obj.imageID, buffer, bufferOffset);
    // Serialize message field [object_poses]
    // Serialize the length for message field [object_poses]
    bufferOffset = _serializer.uint32(obj.object_poses.length, buffer, bufferOffset);
    obj.object_poses.forEach((val) => {
      bufferOffset = BBPose.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BBPoses
    let len;
    let data = new BBPoses(null);
    // Deserialize message field [stamp]
    data.stamp = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [imageID]
    data.imageID = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [object_poses]
    // Deserialize array length for message field [object_poses]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.object_poses = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.object_poses[i] = BBPose.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 37 * object.object_poses.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mav_utils_msgs/BBPoses';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ed4ca9b702b46a3d3b707fa59df1e978';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    time stamp
    int32 imageID
    BBPose[] object_poses
    
    ================================================================================
    MSG: mav_utils_msgs/BBPose
    int32 boxID
    int32 type
    float32 area
    bool store
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
    const resolved = new BBPoses(null);
    if (msg.stamp !== undefined) {
      resolved.stamp = msg.stamp;
    }
    else {
      resolved.stamp = {secs: 0, nsecs: 0}
    }

    if (msg.imageID !== undefined) {
      resolved.imageID = msg.imageID;
    }
    else {
      resolved.imageID = 0
    }

    if (msg.object_poses !== undefined) {
      resolved.object_poses = new Array(msg.object_poses.length);
      for (let i = 0; i < resolved.object_poses.length; ++i) {
        resolved.object_poses[i] = BBPose.Resolve(msg.object_poses[i]);
      }
    }
    else {
      resolved.object_poses = []
    }

    return resolved;
    }
};

module.exports = BBPoses;
