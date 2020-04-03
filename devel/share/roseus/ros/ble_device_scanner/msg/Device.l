;; Auto-generated. Do not edit!


(when (boundp 'ble_device_scanner::Device)
  (if (not (find-package "BLE_DEVICE_SCANNER"))
    (make-package "BLE_DEVICE_SCANNER"))
  (shadow 'Device (find-package "BLE_DEVICE_SCANNER")))
(unless (find-package "BLE_DEVICE_SCANNER::DEVICE")
  (make-package "BLE_DEVICE_SCANNER::DEVICE"))

(in-package "ROS")
;;//! \htmlinclude Device.msg.html


(defclass ble_device_scanner::Device
  :super ros::object
  :slots (_rssi _addr _data ))

(defmethod ble_device_scanner::Device
  (:init
   (&key
    ((:rssi __rssi) "")
    ((:addr __addr) "")
    ((:data __data) (let (r) (dotimes (i 0) (push (instance ble_device_scanner::DeviceTuple :init) r)) r))
    )
   (send-super :init)
   (setq _rssi (string __rssi))
   (setq _addr (string __addr))
   (setq _data __data)
   self)
  (:rssi
   (&optional __rssi)
   (if __rssi (setq _rssi __rssi)) _rssi)
  (:addr
   (&optional __addr)
   (if __addr (setq _addr __addr)) _addr)
  (:data
   (&rest __data)
   (if (keywordp (car __data))
       (send* _data __data)
     (progn
       (if __data (setq _data (car __data)))
       _data)))
  (:serialization-length
   ()
   (+
    ;; string _rssi
    4 (length _rssi)
    ;; string _addr
    4 (length _addr)
    ;; ble_device_scanner/DeviceTuple[] _data
    (apply #'+ (send-all _data :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _rssi
       (write-long (length _rssi) s) (princ _rssi s)
     ;; string _addr
       (write-long (length _addr) s) (princ _addr s)
     ;; ble_device_scanner/DeviceTuple[] _data
     (write-long (length _data) s)
     (dolist (elem _data)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _rssi
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _rssi (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _addr
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _addr (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; ble_device_scanner/DeviceTuple[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (let (r) (dotimes (i n) (push (instance ble_device_scanner::DeviceTuple :init) r)) r))
     (dolist (elem- _data)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get ble_device_scanner::Device :md5sum-) "e03a19bb1ab8f84d7afc20ee8710cc46")
(setf (get ble_device_scanner::Device :datatype-) "ble_device_scanner/Device")
(setf (get ble_device_scanner::Device :definition-)
      "string rssi
string addr
ble_device_scanner/DeviceTuple[] data

================================================================================
MSG: ble_device_scanner/DeviceTuple
string adtype
string description
string value
")



(provide :ble_device_scanner/Device "e03a19bb1ab8f84d7afc20ee8710cc46")


