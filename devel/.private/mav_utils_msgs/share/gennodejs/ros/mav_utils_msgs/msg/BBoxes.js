// Auto-generated. Do not edit!

// (in-package mav_utils_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let BBox = require('./BBox.js');

//-----------------------------------------------------------

class BBoxes {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.stamp = null;
      this.imageID = null;
      this.objects = null;
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
      if (initObj.hasOwnProperty('objects')) {
        this.objects = initObj.objects
      }
      else {
        this.objects = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BBoxes
    // Serialize message field [stamp]
    bufferOffset = _serializer.time(obj.stamp, buffer, bufferOffset);
    // Serialize message field [imageID]
    bufferOffset = _serializer.int32(obj.imageID, buffer, bufferOffset);
    // Serialize message field [objects]
    // Serialize the length for message field [objects]
    bufferOffset = _serializer.uint32(obj.objects.length, buffer, bufferOffset);
    obj.objects.forEach((val) => {
      bufferOffset = BBox.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BBoxes
    let len;
    let data = new BBoxes(null);
    // Deserialize message field [stamp]
    data.stamp = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [imageID]
    data.imageID = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [objects]
    // Deserialize array length for message field [objects]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.objects = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.objects[i] = BBox.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.objects.forEach((val) => {
      length += BBox.getMessageSize(val);
    });
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mav_utils_msgs/BBoxes';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '132eb21f59342318bc09c3939b6621fb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    time stamp
    int32 imageID
    BBox[] objects
    
    ================================================================================
    MSG: mav_utils_msgs/BBox
    int32 boxID
    int32 pixSize
    int32 contourSize
    string colour
    float32 diagIndex
    float32 areaIndex
    float32 eigenIndex
    int32[] rangeX
    int32[] rangeY
    float32[] centre
    float32[] cornerX
    float32[] cornerY
    float32[] eigenVal
    float32[] eigenVec
    int32[] contourX
    int32[] contourY
    bool full
    bool store
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BBoxes(null);
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

    if (msg.objects !== undefined) {
      resolved.objects = new Array(msg.objects.length);
      for (let i = 0; i < resolved.objects.length; ++i) {
        resolved.objects[i] = BBox.Resolve(msg.objects[i]);
      }
    }
    else {
      resolved.objects = []
    }

    return resolved;
    }
};

module.exports = BBoxes;
