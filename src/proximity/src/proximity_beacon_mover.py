#! /usr/bin/env python

import rospy

import yaml

import actionlib

import proximity.msg

from beacon import Beacon
from position import Position

from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal

class MoveToBeaconAction(object):
    _feedback = proximity.msg.BeaconFeedback()
    _result = proximity.msg.BeaconResult()

    def __init__(self, name):
        self._action_name = name
        self._as = actionlib.SimpleActionServer(self._action_name, proximity.msg.BeaconAction, execute_cb=self.execute_cb, auto_start = False)
        self._as.start()
      
    def execute_cb(self, goal):
        r = rospy.Rate(1)
        success = True
        beacon = beaconFinder(goal.address)
        if beacon == None:
            self._feedback.state = "No beacon found with that address"
            success = False
        else:
            self._feedback.state = "Beacon found"
            result_client = moveToBeacon(beacon)
            if result_client:
                self._feedback.state = "Navigation done"

        if success:
            self._result.result = self._feedback.state
            self._as.set_succeeded(self._result)
        else:
            self._result.result = self._feedback.state
            self._as.set_aborted(self._result)



def beaconFinder(address):
    with open('/home/pieter/beacons.yaml') as f:
        dataMap = yaml.load(f,  Loader=yaml.Loader)
        for beacon in dataMap:
            if address == beacon._addr:
                return beacon
        return None

def moveToBeacon(beacon):
    client = actionlib.SimpleActionClient('move_base',MoveBaseAction)
    client.wait_for_server()
    goal = MoveBaseGoal()
    goal.target_pose.header.frame_id = "map"
    goal.target_pose.header.stamp = rospy.Time.now()
 
    goal.target_pose.pose.position.x = beacon._bestPosition._x
    goal.target_pose.pose.position.y = beacon._bestPosition._y
    goal.target_pose.pose.orientation.w = 1.0

    client.send_goal(goal)
    wait = client.wait_for_result()

    if not wait:
        rospy.logerr("Action server not available!")
        rospy.signal_shutdown("Action server not available!")
    else:
        return client.get_result()   



if __name__ == '__main__':
    rospy.init_node('move_to_beacon_action')
    server = MoveToBeaconAction(rospy.get_name())
    rospy.spin()