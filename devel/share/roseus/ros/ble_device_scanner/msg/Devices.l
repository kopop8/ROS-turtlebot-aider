;; Auto-generated. Do not edit!


(when (boundp 'ble_device_scanner::Devices)
  (if (not (find-package "BLE_DEVICE_SCANNER"))
    (make-package "BLE_DEVICE_SCANNER"))
  (shadow 'Devices (find-package "BLE_DEVICE_SCANNER")))
(unless (find-package "BLE_DEVICE_SCANNER::DEVICES")
  (make-package "BLE_DEVICE_SCANNER::DEVICES"))

(in-package "ROS")
;;//! \htmlinclude Devices.msg.html


(defclass ble_device_scanner::Devices
  :super ros::object
  :slots (_devices ))

(defmethod ble_device_scanner::Devices
  (:init
   (&key
    ((:devices __devices) (let (r) (dotimes (i 0) (push (instance ble_device_scanner::Device :init) r)) r))
    )
   (send-super :init)
   (setq _devices __devices)
   self)
  (:devices
   (&rest __devices)
   (if (keywordp (car __devices))
       (send* _devices __devices)
     (progn
       (if __devices (setq _devices (car __devices)))
       _devices)))
  (:serialization-length
   ()
   (+
    ;; ble_device_scanner/Device[] _devices
    (apply #'+ (send-all _devices :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; ble_device_scanner/Device[] _devices
     (write-long (length _devices) s)
     (dolist (elem _devices)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; ble_device_scanner/Device[] _devices
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _devices (let (r) (dotimes (i n) (push (instance ble_device_scanner::Device :init) r)) r))
     (dolist (elem- _devices)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get ble_device_scanner::Devices :md5sum-) "a6b9a7c347baec7197f38a109b072f06")
(setf (get ble_device_scanner::Devices :datatype-) "ble_device_scanner/Devices")
(setf (get ble_device_scanner::Devices :definition-)
      "ble_device_scanner/Device[] devices
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
")



(provide :ble_device_scanner/Devices "a6b9a7c347baec7197f38a109b072f06")


