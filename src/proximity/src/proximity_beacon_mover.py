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
        self._client = actionlib.SimpleActionClient('move_base',MoveBaseAction)
        rospy.loginfo('Connecting to move_base...')
        self._client.wait_for_server()
        rospy.loginfo('Server ready and waiting for action...')
      
    def execute_cb(self, goal):
        rospy.loginfo('Got action! {}'.format(goal))
        r = rospy.Rate(1)
        success = True
        beacon = self.beaconFinder(goal.address)
        if beacon == None:
            rospy.logerr("Beacon with address {} not found".format(goal.address))
            self._feedback.state = "No beacon found with that address"
            success = False
        else:
            self._feedback.state = "Beacon found"
            result_client = self.moveToBeacon(beacon)
            if result_client:
                self._feedback.state = "Navigation done"

        if success:
            self._result.result = self._feedback.state
            self._as.set_succeeded(self._result)
        else:
            self._result.result = self._feedback.state
            self._as.set_aborted(self._result)



    def beaconFinder(self, address):
        with open('/home/pieter/output/beacons.yaml') as f:
            dataMap = yaml.load(f,  Loader=yaml.Loader)
            for beacon in dataMap:
                if address == beacon._addr:
                    return beacon
            return None

    def moveToBeacon(self, beacon):

        goal = MoveBaseGoal()
        goal.target_pose.header.frame_id = "map"
        goal.target_pose.header.stamp = rospy.Time.now()

        goal.target_pose.pose.position.x = beacon._bestPosition._x
        goal.target_pose.pose.position.y = beacon._bestPosition._y

        goal.target_pose.pose.orientation.w = beacon._bestPosition._w
        self._client.send_goal(goal)
        wait = self._client.wait_for_result()

        if not wait:
            rospy.logerr("Action server not available!")
            rospy.signal_shutdown("Action server not available!")
        else:
            return self._client.get_result()   



if __name__ == '__main__':
    rospy.init_node('move_to_beacon_action')
    server = MoveToBeaconAction(rospy.get_name())
    rospy.spin()