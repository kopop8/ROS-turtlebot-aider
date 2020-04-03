; Auto-generated. Do not edit!


(cl:in-package ble_device_scanner-msg)


;//! \htmlinclude DeviceTuple.msg.html

(cl:defclass <DeviceTuple> (roslisp-msg-protocol:ros-message)
  ((adtype
    :reader adtype
    :initarg :adtype
    :type cl:string
    :initform "")
   (description
    :reader description
    :initarg :description
    :type cl:string
    :initform "")
   (value
    :reader value
    :initarg :value
    :type cl:string
    :initform ""))
)

(cl:defclass DeviceTuple (<DeviceTuple>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DeviceTuple>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DeviceTuple)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ble_device_scanner-msg:<DeviceTuple> is deprecated: use ble_device_scanner-msg:DeviceTuple instead.")))

(cl:ensure-generic-function 'adtype-val :lambda-list '(m))
(cl:defmethod adtype-val ((m <DeviceTuple>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ble_device_scanner-msg:adtype-val is deprecated.  Use ble_device_scanner-msg:adtype instead.")
  (adtype m))

(cl:ensure-generic-function 'description-val :lambda-list '(m))
(cl:defmethod description-val ((m <DeviceTuple>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ble_device_scanner-msg:description-val is deprecated.  Use ble_device_scanner-msg:description instead.")
  (description m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <DeviceTuple>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ble_device_scanner-msg:value-val is deprecated.  Use ble_device_scanner-msg:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DeviceTuple>) ostream)
  "Serializes a message object of type '<DeviceTuple>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'adtype))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'adtype))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'description))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'description))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'value))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DeviceTuple>) istream)
  "Deserializes a message object of type '<DeviceTuple>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'adtype) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'adtype) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'description) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'description) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'value) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DeviceTuple>)))
  "Returns string type for a message object of type '<DeviceTuple>"
  "ble_device_scanner/DeviceTuple")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DeviceTuple)))
  "Returns string type for a message object of type 'DeviceTuple"
  "ble_device_scanner/DeviceTuple")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DeviceTuple>)))
  "Returns md5sum for a message object of type '<DeviceTuple>"
  "95ad3a1e30c3e0f92aabbef8049d4259")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DeviceTuple)))
  "Returns md5sum for a message object of type 'DeviceTuple"
  "95ad3a1e30c3e0f92aabbef8049d4259")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DeviceTuple>)))
  "Returns full string definition for message of type '<DeviceTuple>"
  (cl:format cl:nil "string adtype~%string description~%string value~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DeviceTuple)))
  "Returns full string definition for message of type 'DeviceTuple"
  (cl:format cl:nil "string adtype~%string description~%string value~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DeviceTuple>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'adtype))
     4 (cl:length (cl:slot-value msg 'description))
     4 (cl:length (cl:slot-value msg 'value))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DeviceTuple>))
  "Converts a ROS message object to a list"
  (cl:list 'DeviceTuple
    (cl:cons ':adtype (adtype msg))
    (cl:cons ':description (description msg))
    (cl:cons ':value (value msg))
))
