#!/usr/bin/env python
import rospy
from collections import deque
from std_msgs.msg import String
from ble_device_scanner.msg import Device, Devices, DeviceTuple
from nav_msgs.msg import Odometry
from beacon import Beacon
from position import Position
import yaml
beacons = []

ID_MANUFACTURER = "4c000215e2c56db5dffb48d2b060d0f5a71096e0000a"

# POSITION has x y z and rssi

# BEACON TODO add NAME




def callback(data):
    position = rospy.wait_for_message("odom", Odometry).pose.pose.position
    for device in data.devices:
        for data in device.data:
            if ID_MANUFACTURER in data.value:
                name = "Beacon {}".format(data.value.replace(ID_MANUFACTURER,''))
                if len(beacons) == 0:
                    tempBeacon = Beacon(name, device.addr)
                    tempBeacon.enqueue(Position(position.x,position.y,position.z, device.rssi))
                    beacons.append(tempBeacon)
                else:
                    foundBeacon = False
                    for beacon in beacons:
                        # add to queue if beacon already exsists
                        if beacon._addr == device.addr:
                            foundBeacon = True
                            beacon.enqueue(Position(position.x,position.y,position.z, device.rssi))
                    # add beacon to list if not found
                    if foundBeacon == False:
                        tempBeacon = Beacon(name, device.addr)
                        tempBeacon.enqueue(Position(position.x,position.y,position.z, device.rssi))
                        beacons.append(tempBeacon)
    f = open("/home/pieter/beacons.yaml", "w")

    f.write(yaml.dump(beacons))
    f.close()
    rospy.loginfo(yaml.dump(beacons))
  
    
def listener():
    rospy.init_node('proximity_beacon_tracker', anonymous=True)
    rospy.Subscriber("ble_devices", Devices, callback)
    rospy.spin()

if __name__ == '__main__':
    listener()