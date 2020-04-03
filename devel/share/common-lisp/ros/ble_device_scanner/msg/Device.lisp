; Auto-generated. Do not edit!


(cl:in-package ble_device_scanner-msg)


;//! \htmlinclude Device.msg.html

(cl:defclass <Device> (roslisp-msg-protocol:ros-message)
  ((rssi
    :reader rssi
    :initarg :rssi
    :type cl:string
    :initform "")
   (addr
    :reader addr
    :initarg :addr
    :type cl:string
    :initform "")
   (data
    :reader data
    :initarg :data
    :type (cl:vector ble_device_scanner-msg:DeviceTuple)
   :initform (cl:make-array 0 :element-type 'ble_device_scanner-msg:DeviceTuple :initial-element (cl:make-instance 'ble_device_scanner-msg:DeviceTuple))))
)

(cl:defclass Device (<Device>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Device>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Device)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ble_device_scanner-msg:<Device> is deprecated: use ble_device_scanner-msg:Device instead.")))

(cl:ensure-generic-function 'rssi-val :lambda-list '(m))
(cl:defmethod rssi-val ((m <Device>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ble_device_scanner-msg:rssi-val is deprecated.  Use ble_device_scanner-msg:rssi instead.")
  (rssi m))

(cl:ensure-generic-function 'addr-val :lambda-list '(m))
(cl:defmethod addr-val ((m <Device>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ble_device_scanner-msg:addr-val is deprecated.  Use ble_device_scanner-msg:addr instead.")
  (addr m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <Device>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ble_device_scanner-msg:data-val is deprecated.  Use ble_device_scanner-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Device>) ostream)
  "Serializes a message object of type '<Device>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'rssi))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'rssi))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'addr))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'addr))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Device>) istream)
  "Deserializes a message object of type '<Device>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rssi) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'rssi) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'addr) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'addr) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ble_device_scanner-msg:DeviceTuple))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Device>)))
  "Returns string type for a message object of type '<Device>"
  "ble_device_scanner/Device")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Device)))
  "Returns string type for a message object of type 'Device"
  "ble_device_scanner/Device")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Device>)))
  "Returns md5sum for a message object of type '<Device>"
  "e03a19bb1ab8f84d7afc20ee8710cc46")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Device)))
  "Returns md5sum for a message object of type 'Device"
  "e03a19bb1ab8f84d7afc20ee8710cc46")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Device>)))
  "Returns full string definition for message of type '<Device>"
  (cl:format cl:nil "string rssi~%string addr~%ble_device_scanner/DeviceTuple[] data~%~%================================================================================~%MSG: ble_device_scanner/DeviceTuple~%string adtype~%string description~%string value~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Device)))
  "Returns full string definition for message of type 'Device"
  (cl:format cl:nil "string rssi~%string addr~%ble_device_scanner/DeviceTuple[] data~%~%================================================================================~%MSG: ble_device_scanner/DeviceTuple~%string adtype~%string description~%string value~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Device>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'rssi))
     4 (cl:length (cl:slot-value msg 'addr))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Device>))
  "Converts a ROS message object to a list"
  (cl:list 'Device
    (cl:cons ':rssi (rssi msg))
    (cl:cons ':addr (addr msg))
    (cl:cons ':data (data msg))
))
