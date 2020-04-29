#!/usr/bin/env python
import rospy
from bluepy.btle import Scanner, DefaultDelegate
from std_msgs.msg import String
from ble_device_scanner.msg import Device, Devices, DeviceTuple


def talker():
    pub = rospy.Publisher('ble_devices', Devices ,queue_size=10)
    rospy.init_node('ble_scanner', anonymous=True)
    # 10 times in 1 sec rate
    rate = rospy.Rate(10)
    # keep scanning and publishing while not shutdown
    while not rospy.is_shutdown():
        devices = scanner()
        # publish the returned ble devices
        pub.publish(devices)
        rate.sleep()

# Scans for ble devices and converts them in publishable ble devices 
def scanner():
    scanner = Scanner()
    # scan 2 times every seccond
    devices = scanner.scan(0.5)
    ble_devices = []
    # put all devices in publishable messages.
    for dev in devices:
        temp = Device()
        temp.addr = str(dev.addr)
        temp.rssi = str(dev.rssi)
        # put all the extra data in a tuple array
        for (adtype, desc, value) in dev.getScanData():
            tempTuple = DeviceTuple()
            tempTuple.adtype = str(adtype)
            tempTuple.description = str(desc)
            tempTuple.value = str(value)
            temp.data.append(tempTuple)
        ble_devices.append(temp)
    return ble_devices

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass