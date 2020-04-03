// Auto-generated. Do not edit!

// (in-package ble_device_scanner.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Device = require('./Device.js');

//-----------------------------------------------------------

class Devices {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.devices = null;
    }
    else {
      if (initObj.hasOwnProperty('devices')) {
        this.devices = initObj.devices
      }
      else {
        this.devices = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Devices
    // Serialize message field [devices]
    // Serialize the length for message field [devices]
    bufferOffset = _serializer.uint32(obj.devices.length, buffer, bufferOffset);
    obj.devices.forEach((val) => {
      bufferOffset = Device.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Devices
    let len;
    let data = new Devices(null);
    // Deserialize message field [devices]
    // Deserialize array length for message field [devices]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.devices = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.devices[i] = Device.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.devices.forEach((val) => {
      length += Device.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ble_device_scanner/Devices';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a6b9a7c347baec7197f38a109b072f06';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    ble_device_scanner/Device[] devices
    ================================================================================
    MSG: ble_device_scanner/Device
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
    const resolved = new Devices(null);
    if (msg.devices !== undefined) {
      resolved.devices = new Array(msg.devices.length);
      for (let i = 0; i < resolved.devices.length; ++i) {
        resolved.devices[i] = Device.Resolve(msg.devices[i]);
      }
    }
    else {
      resolved.devices = []
    }

    return resolved;
    }
};

module.exports = Devices;
