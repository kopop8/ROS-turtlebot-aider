// Auto-generated. Do not edit!

// (in-package ble_device_scanner.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let DeviceTuple = require('./DeviceTuple.js');

//-----------------------------------------------------------

class Device {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.rssi = null;
      this.addr = null;
      this.data = null;
    }
    else {
      if (initObj.hasOwnProperty('rssi')) {
        this.rssi = initObj.rssi
      }
      else {
        this.rssi = '';
      }
      if (initObj.hasOwnProperty('addr')) {
        this.addr = initObj.addr
      }
      else {
        this.addr = '';
      }
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Device
    // Serialize message field [rssi]
    bufferOffset = _serializer.string(obj.rssi, buffer, bufferOffset);
    // Serialize message field [addr]
    bufferOffset = _serializer.string(obj.addr, buffer, bufferOffset);
    // Serialize message field [data]
    // Serialize the length for message field [data]
    bufferOffset = _serializer.uint32(obj.data.length, buffer, bufferOffset);
    obj.data.forEach((val) => {
      bufferOffset = DeviceTuple.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Device
    let len;
    let data = new Device(null);
    // Deserialize message field [rssi]
    data.rssi = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [addr]
    data.addr = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [data]
    // Deserialize array length for message field [data]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.data = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.data[i] = DeviceTuple.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.rssi.length;
    length += object.addr.length;
    object.data.forEach((val) => {
      length += DeviceTuple.getMessageSize(val);
    });
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ble_device_scanner/Device';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e03a19bb1ab8f84d7afc20ee8710cc46';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string rssi
    string addr
    ble_device_scanner/DeviceTuple[] data
    
    ================================================================================
    MSG: ble_device_scanner/DeviceTuple
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
    const resolved = new Device(null);
    if (msg.rssi !== undefined) {
      resolved.rssi = msg.rssi;
    }
    else {
      resolved.rssi = ''
    }

    if (msg.addr !== undefined) {
      resolved.addr = msg.addr;
    }
    else {
      resolved.addr = ''
    }

    if (msg.data !== undefined) {
      resolved.data = new Array(msg.data.length);
      for (let i = 0; i < resolved.data.length; ++i) {
        resolved.data[i] = DeviceTuple.Resolve(msg.data[i]);
      }
    }
    else {
      resolved.data = []
    }

    return resolved;
    }
};

module.exports = Device;
