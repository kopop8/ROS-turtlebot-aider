#!/usr/bin/env python
import rospy
from collections import deque
from std_msgs.msg import String
from ble_device_scanner.msg import Device, Devices, DeviceTuple
from nav_msgs.msg import Odometry
from beacon import Beacon
from position import Position
import yaml
import tf.msg
from proximity.msg import RobotPosition
import geometry_msgs.msg

# List of beacons
beacons = []

# ID of Manufacturer
ID_MANUFACTURER = "4c000215e2c56db5dffb48d2b060d0f5a71096e0000a"
# ID of Mobile phone beacon
ID_MOBILE = "4c000215bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb000000009c"

# Get position of robot in the map.
def getPosition():
    position = rospy.wait_for_message("robot_position", RobotPosition)
    return position

# Function saves bluetooth beacon with best position in a yaml file
def callback(data):
    # First get the position of the robot in the map.
    position = getPosition()
    for device in data.devices:
        for data in device.data:
            # Look if found device is a beacon of us.
            if ID_MANUFACTURER in data.value:
                name = "Beacon {}".format(data.value.replace(ID_MANUFACTURER,''))
                # If the array of beacons is empty add the beacon to it
                if len(beacons) == 0:
                    tempBeacon = Beacon(name, device.addr)
                    # Add first position measurement to queue
                    tempBeacon.enqueue(Position(position.x,position.y,position.z, position.w, device.rssi))
                    beacons.append(tempBeacon)
                else:
                    foundBeacon = False
                    # check in array of beacons if beacons is already in list.
                    for beacon in beacons:
                        # add new position measurement to queue if beacon already exsists
                        if beacon._addr == device.addr:
                            foundBeacon = True
                            beacon.enqueue(Position(position.x,position.y,position.z, position.w, device.rssi))
                    # add beacon to list if not found
                    if foundBeacon == False:
                        tempBeacon = Beacon(name, device.addr)
                        # Add first position measurement to queue
                        tempBeacon.enqueue(Position(position.x,position.y,position.z, position.w, device.rssi))
                        beacons.append(tempBeacon)
    # Write beacons to file
    f = open("/home/pieter/output/beacons.yaml", "w")
    f.write(yaml.dump(beacons))
    f.close()
    rospy.loginfo(yaml.dump(beacons))
  
    
def listener():
    rospy.init_node('proximity_beacon_tracker', anonymous=True)
    rospy.Subscriber("ble_devices", Devices, callback)
    rospy.spin()

if __name__ == '__main__':
    listener()