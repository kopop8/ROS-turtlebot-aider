
(cl:in-package :asdf)

(defsystem "ble_device_scanner-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Device" :depends-on ("_package_Device"))
    (:file "_package_Device" :depends-on ("_package"))
    (:file "DeviceTuple" :depends-on ("_package_DeviceTuple"))
    (:file "_package_DeviceTuple" :depends-on ("_package"))
    (:file "Devices" :depends-on ("_package_Devices"))
    (:file "_package_Devices" :depends-on ("_package"))
  ))