#!/usr/bin/env python
import rospy
from collections import deque
from std_msgs.msg import String
from ble_device_scanner.msg import Device, Devices, DeviceTuple
from nav_msgs.msg import Odometry


beacons = []

ID_MANUFACTURER = "4c000215e2c56db5dffb48d2b060d0f5a71096e0000a"

# POSITION has x y z and rssi
class Position:
    def __init__(self, x, y, z, rssi):
        self._x = float(x)
        self._y = float(y)
        self._z = float(z)
        self._rssi = float(rssi)


    def __str__(self):
            return "x: {}, y:{}, rssi: {}".format(self._x, self._y,self._rssi)
    def __repr__(self):
            return str(self)
# BEACON TODO add NAME
class Beacon:
        def __init__(self, addr):
            self._queue = deque(maxlen=5)
            self._addr = addr
            self._bestPosition = None

        def enqueue(self,position):
            self._queue.append(position)
            if self._bestPosition == None:
                self._bestPosition = position
            else:
                # count total and calculate average rssi
                total = 0
                for position in self._queue:
                    total+= position._rssi
                averageRssi = float(total) / len(self._queue)
                # if rssi is beter than last bestPosition change it to new position
                if(averageRssi>self._bestPosition._rssi):
                    tempPosition = None
                    for position in self._queue:
                        if tempPosition == None:
                            tempPosition = position
                        elif tempPosition._rssi < position._rssi:
                            tempPosition = position
                    self._bestPosition = tempPosition

        def __str__(self):
            return "addr: {}, best position: {} rssis: {}".format(self._addr, self._bestPosition,self._queue)
        def __repr__(self):
            return str(self)



def callback(data):
    position = rospy.wait_for_message("odom", Odometry).pose.pose.position
    for device in data.devices:
        for data in device.data:
            if ID_MANUFACTURER in data.value:
                if len(beacons) == 0:
                    tempBeacon = Beacon(device.addr)
                    tempBeacon.enqueue(Position(position.x,position.y,position.z, device.rssi))
                    beacons.append(tempBeacon)
                else:
                    foundBeacon = False
                    for beacon in beacons:
                        if beacon._addr == device.addr:
                            foundBeacon = True
                            beacon.enqueue(Position(position.x,position.y,position.z, device.rssi))
                    if foundBeacon == False:
                        tempBeacon = Beacon(device.addr)
                        tempBeacon.enqueue(Position(position.x,position.y,position.z, device.rssi))
                        beacons.append(tempBeacon)
    print(beacons)

    
def listener():
    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber("ble_devices", Devices, callback)
    rospy.spin()

if __name__ == '__main__':
    listener()