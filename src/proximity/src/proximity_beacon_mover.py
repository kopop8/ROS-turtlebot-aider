#! /usr/bin/env python

import rospy

import actionlib

import proximity.msg

class FibonacciAction(object):
    # create messages that are used to publish feedback/result
    _feedback = proximity.msg.BeaconFeedback()
    _result = proximity.msg.BeaconResult()

    def __init__(self, name):
        self._action_name = name
        self._as = actionlib.SimpleActionServer(self._action_name, proximity.msg.BeaconAction, execute_cb=self.execute_cb, auto_start = False)
        self._as.start()
      
    def execute_cb(self, goal):
        # helper variables
        r = rospy.Rate(1)
        success = True
        rospy.loginfo(goal)
        # append the seeds for the fibonacci sequence
        # TODO RIJENN
        self._feedback.state = "Done"
        if success:
            self._result.result = self._feedback.state
            rospy.loginfo('%s: Succeeded' % self._action_name)
            self._as.set_succeeded(self._result)
        
if __name__ == '__main__':
    rospy.init_node('move_to_beacon_action')
    server = FibonacciAction(rospy.get_name())
    rospy.spin()