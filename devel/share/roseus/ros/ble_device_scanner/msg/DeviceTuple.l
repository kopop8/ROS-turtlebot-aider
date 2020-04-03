;; Auto-generated. Do not edit!


(when (boundp 'ble_device_scanner::DeviceTuple)
  (if (not (find-package "BLE_DEVICE_SCANNER"))
    (make-package "BLE_DEVICE_SCANNER"))
  (shadow 'DeviceTuple (find-package "BLE_DEVICE_SCANNER")))
(unless (find-package "BLE_DEVICE_SCANNER::DEVICETUPLE")
  (make-package "BLE_DEVICE_SCANNER::DEVICETUPLE"))

(in-package "ROS")
;;//! \htmlinclude DeviceTuple.msg.html


(defclass ble_device_scanner::DeviceTuple
  :super ros::object
  :slots (_adtype _description _value ))

(defmethod ble_device_scanner::DeviceTuple
  (:init
   (&key
    ((:adtype __adtype) "")
    ((:description __description) "")
    ((:value __value) "")
    )
   (send-super :init)
   (setq _adtype (string __adtype))
   (setq _description (string __description))
   (setq _value (string __value))
   self)
  (:adtype
   (&optional __adtype)
   (if __adtype (setq _adtype __adtype)) _adtype)
  (:description
   (&optional __description)
   (if __description (setq _description __description)) _description)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; string _adtype
    4 (length _adtype)
    ;; string _description
    4 (length _description)
    ;; string _value
    4 (length _value)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _adtype
       (write-long (length _adtype) s) (princ _adtype s)
     ;; string _description
       (write-long (length _description) s) (princ _description s)
     ;; string _value
       (write-long (length _value) s) (princ _value s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _adtype
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _adtype (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _description
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _description (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _value
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _value (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get ble_device_scanner::DeviceTuple :md5sum-) "95ad3a1e30c3e0f92aabbef8049d4259")
(setf (get ble_device_scanner::DeviceTuple :datatype-) "ble_device_scanner/DeviceTuple")
(setf (get ble_device_scanner::DeviceTuple :definition-)
      "string adtype
string description
string value
")



(provide :ble_device_scanner/DeviceTuple "95ad3a1e30c3e0f92aabbef8049d4259")


