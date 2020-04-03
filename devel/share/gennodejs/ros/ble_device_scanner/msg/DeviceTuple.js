// Auto-generated. Do not edit!

// (in-package ble_device_scanner.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class DeviceTuple {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.adtype = null;
      this.description = null;
      this.value = null;
    }
    else {
      if (initObj.hasOwnProperty('adtype')) {
        this.adtype = initObj.adtype
      }
      else {
        this.adtype = '';
      }
      if (initObj.hasOwnProperty('description')) {
        this.description = initObj.description
      }
      else {
        this.description = '';
      }
      if (initObj.hasOwnProperty('value')) {
        this.value = initObj.value
      }
      else {
        this.value = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DeviceTuple
    // Serialize message field [adtype]
    bufferOffset = _serializer.string(obj.adtype, buffer, bufferOffset);
    // Serialize message field [description]
    bufferOffset = _serializer.string(obj.description, buffer, bufferOffset);
    // Serialize message field [value]
    bufferOffset = _serializer.string(obj.value, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DeviceTuple
    let len;
    let data = new DeviceTuple(null);
    // Deserialize message field [adtype]
    data.adtype = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [description]
    data.description = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [value]
    data.value = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.adtype.length;
    length += object.description.length;
    length += object.value.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ble_device_scanner/DeviceTuple';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '95ad3a1e30c3e0f92aabbef8049d4259';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string adtype
    string description
    string value
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DeviceTuple(null);
    if (msg.adtype !== undefined) {
      resolved.adtype = msg.adtype;
    }
    else {
      resolved.adtype = ''
    }

    if (msg.description !== undefined) {
      resolved.description = msg.description;
    }
    else {
      resolved.description = ''
    }

    if (msg.value !== undefined) {
      resolved.value = msg.value;
    }
    else {
      resolved.value = ''
    }

    return resolved;
    }
};

module.exports = DeviceTuple;
