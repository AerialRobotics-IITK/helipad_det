// Auto-generated. Do not edit!

// (in-package mav_utils_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class BBox {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.boxID = null;
      this.pixSize = null;
      this.contourSize = null;
      this.colour = null;
      this.diagIndex = null;
      this.areaIndex = null;
      this.eigenIndex = null;
      this.rangeX = null;
      this.rangeY = null;
      this.centre = null;
      this.cornerX = null;
      this.cornerY = null;
      this.eigenVal = null;
      this.eigenVec = null;
      this.contourX = null;
      this.contourY = null;
      this.full = null;
      this.store = null;
    }
    else {
      if (initObj.hasOwnProperty('boxID')) {
        this.boxID = initObj.boxID
      }
      else {
        this.boxID = 0;
      }
      if (initObj.hasOwnProperty('pixSize')) {
        this.pixSize = initObj.pixSize
      }
      else {
        this.pixSize = 0;
      }
      if (initObj.hasOwnProperty('contourSize')) {
        this.contourSize = initObj.contourSize
      }
      else {
        this.contourSize = 0;
      }
      if (initObj.hasOwnProperty('colour')) {
        this.colour = initObj.colour
      }
      else {
        this.colour = '';
      }
      if (initObj.hasOwnProperty('diagIndex')) {
        this.diagIndex = initObj.diagIndex
      }
      else {
        this.diagIndex = 0.0;
      }
      if (initObj.hasOwnProperty('areaIndex')) {
        this.areaIndex = initObj.areaIndex
      }
      else {
        this.areaIndex = 0.0;
      }
      if (initObj.hasOwnProperty('eigenIndex')) {
        this.eigenIndex = initObj.eigenIndex
      }
      else {
        this.eigenIndex = 0.0;
      }
      if (initObj.hasOwnProperty('rangeX')) {
        this.rangeX = initObj.rangeX
      }
      else {
        this.rangeX = [];
      }
      if (initObj.hasOwnProperty('rangeY')) {
        this.rangeY = initObj.rangeY
      }
      else {
        this.rangeY = [];
      }
      if (initObj.hasOwnProperty('centre')) {
        this.centre = initObj.centre
      }
      else {
        this.centre = [];
      }
      if (initObj.hasOwnProperty('cornerX')) {
        this.cornerX = initObj.cornerX
      }
      else {
        this.cornerX = [];
      }
      if (initObj.hasOwnProperty('cornerY')) {
        this.cornerY = initObj.cornerY
      }
      else {
        this.cornerY = [];
      }
      if (initObj.hasOwnProperty('eigenVal')) {
        this.eigenVal = initObj.eigenVal
      }
      else {
        this.eigenVal = [];
      }
      if (initObj.hasOwnProperty('eigenVec')) {
        this.eigenVec = initObj.eigenVec
      }
      else {
        this.eigenVec = [];
      }
      if (initObj.hasOwnProperty('contourX')) {
        this.contourX = initObj.contourX
      }
      else {
        this.contourX = [];
      }
      if (initObj.hasOwnProperty('contourY')) {
        this.contourY = initObj.contourY
      }
      else {
        this.contourY = [];
      }
      if (initObj.hasOwnProperty('full')) {
        this.full = initObj.full
      }
      else {
        this.full = false;
      }
      if (initObj.hasOwnProperty('store')) {
        this.store = initObj.store
      }
      else {
        this.store = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BBox
    // Serialize message field [boxID]
    bufferOffset = _serializer.int32(obj.boxID, buffer, bufferOffset);
    // Serialize message field [pixSize]
    bufferOffset = _serializer.int32(obj.pixSize, buffer, bufferOffset);
    // Serialize message field [contourSize]
    bufferOffset = _serializer.int32(obj.contourSize, buffer, bufferOffset);
    // Serialize message field [colour]
    bufferOffset = _serializer.string(obj.colour, buffer, bufferOffset);
    // Serialize message field [diagIndex]
    bufferOffset = _serializer.float32(obj.diagIndex, buffer, bufferOffset);
    // Serialize message field [areaIndex]
    bufferOffset = _serializer.float32(obj.areaIndex, buffer, bufferOffset);
    // Serialize message field [eigenIndex]
    bufferOffset = _serializer.float32(obj.eigenIndex, buffer, bufferOffset);
    // Serialize message field [rangeX]
    bufferOffset = _arraySerializer.int32(obj.rangeX, buffer, bufferOffset, null);
    // Serialize message field [rangeY]
    bufferOffset = _arraySerializer.int32(obj.rangeY, buffer, bufferOffset, null);
    // Serialize message field [centre]
    bufferOffset = _arraySerializer.float32(obj.centre, buffer, bufferOffset, null);
    // Serialize message field [cornerX]
    bufferOffset = _arraySerializer.float32(obj.cornerX, buffer, bufferOffset, null);
    // Serialize message field [cornerY]
    bufferOffset = _arraySerializer.float32(obj.cornerY, buffer, bufferOffset, null);
    // Serialize message field [eigenVal]
    bufferOffset = _arraySerializer.float32(obj.eigenVal, buffer, bufferOffset, null);
    // Serialize message field [eigenVec]
    bufferOffset = _arraySerializer.float32(obj.eigenVec, buffer, bufferOffset, null);
    // Serialize message field [contourX]
    bufferOffset = _arraySerializer.int32(obj.contourX, buffer, bufferOffset, null);
    // Serialize message field [contourY]
    bufferOffset = _arraySerializer.int32(obj.contourY, buffer, bufferOffset, null);
    // Serialize message field [full]
    bufferOffset = _serializer.bool(obj.full, buffer, bufferOffset);
    // Serialize message field [store]
    bufferOffset = _serializer.bool(obj.store, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BBox
    let len;
    let data = new BBox(null);
    // Deserialize message field [boxID]
    data.boxID = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [pixSize]
    data.pixSize = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [contourSize]
    data.contourSize = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [colour]
    data.colour = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [diagIndex]
    data.diagIndex = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [areaIndex]
    data.areaIndex = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [eigenIndex]
    data.eigenIndex = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [rangeX]
    data.rangeX = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [rangeY]
    data.rangeY = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [centre]
    data.centre = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [cornerX]
    data.cornerX = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [cornerY]
    data.cornerY = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [eigenVal]
    data.eigenVal = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [eigenVec]
    data.eigenVec = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [contourX]
    data.contourX = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [contourY]
    data.contourY = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [full]
    data.full = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [store]
    data.store = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.colour);
    length += 4 * object.rangeX.length;
    length += 4 * object.rangeY.length;
    length += 4 * object.centre.length;
    length += 4 * object.cornerX.length;
    length += 4 * object.cornerY.length;
    length += 4 * object.eigenVal.length;
    length += 4 * object.eigenVec.length;
    length += 4 * object.contourX.length;
    length += 4 * object.contourY.length;
    return length + 66;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mav_utils_msgs/BBox';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fd2583954c87e86ec1cf450da38931e5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new BBox(null);
    if (msg.boxID !== undefined) {
      resolved.boxID = msg.boxID;
    }
    else {
      resolved.boxID = 0
    }

    if (msg.pixSize !== undefined) {
      resolved.pixSize = msg.pixSize;
    }
    else {
      resolved.pixSize = 0
    }

    if (msg.contourSize !== undefined) {
      resolved.contourSize = msg.contourSize;
    }
    else {
      resolved.contourSize = 0
    }

    if (msg.colour !== undefined) {
      resolved.colour = msg.colour;
    }
    else {
      resolved.colour = ''
    }

    if (msg.diagIndex !== undefined) {
      resolved.diagIndex = msg.diagIndex;
    }
    else {
      resolved.diagIndex = 0.0
    }

    if (msg.areaIndex !== undefined) {
      resolved.areaIndex = msg.areaIndex;
    }
    else {
      resolved.areaIndex = 0.0
    }

    if (msg.eigenIndex !== undefined) {
      resolved.eigenIndex = msg.eigenIndex;
    }
    else {
      resolved.eigenIndex = 0.0
    }

    if (msg.rangeX !== undefined) {
      resolved.rangeX = msg.rangeX;
    }
    else {
      resolved.rangeX = []
    }

    if (msg.rangeY !== undefined) {
      resolved.rangeY = msg.rangeY;
    }
    else {
      resolved.rangeY = []
    }

    if (msg.centre !== undefined) {
      resolved.centre = msg.centre;
    }
    else {
      resolved.centre = []
    }

    if (msg.cornerX !== undefined) {
      resolved.cornerX = msg.cornerX;
    }
    else {
      resolved.cornerX = []
    }

    if (msg.cornerY !== undefined) {
      resolved.cornerY = msg.cornerY;
    }
    else {
      resolved.cornerY = []
    }

    if (msg.eigenVal !== undefined) {
      resolved.eigenVal = msg.eigenVal;
    }
    else {
      resolved.eigenVal = []
    }

    if (msg.eigenVec !== undefined) {
      resolved.eigenVec = msg.eigenVec;
    }
    else {
      resolved.eigenVec = []
    }

    if (msg.contourX !== undefined) {
      resolved.contourX = msg.contourX;
    }
    else {
      resolved.contourX = []
    }

    if (msg.contourY !== undefined) {
      resolved.contourY = msg.contourY;
    }
    else {
      resolved.contourY = []
    }

    if (msg.full !== undefined) {
      resolved.full = msg.full;
    }
    else {
      resolved.full = false
    }

    if (msg.store !== undefined) {
      resolved.store = msg.store;
    }
    else {
      resolved.store = false
    }

    return resolved;
    }
};

module.exports = BBox;
