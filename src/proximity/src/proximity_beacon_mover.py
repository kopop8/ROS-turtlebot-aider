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



# def movebase_client(address):
#     with open('/home/pieter/beacons.yaml') as f:
#         # use safe_load instead load
#         dataMap = yaml.load(f,  Loader=yaml.Loader)
#         rospy.loginfo(dataMap)

#    # Create an action client called "move_base" with action definition file "MoveBaseAction"
#     client = actionlib.SimpleActionClient('move_base',MoveBaseAction)
 
#    # Waits until the action server has started up and started listening for goals.
#     client.wait_for_server()

#    # Creates a new goal with the MoveBaseGoal constructor
#     goal = MoveBaseGoal()
#     goal.target_pose.header.frame_id = "map"
#     goal.target_pose.header.stamp = rospy.Time.now()
#    # Move 0.5 meters forward along the x axis of the "map" coordinate frame 
#     goal.target_pose.pose.position.x = 2.30914855003
#     goal.target_pose.pose.position.y = -0.090583704412
#     # goal.target_pose.pose.position.z = 0.5
#    # No rotation of the mobile base frame w.r.t. map frame
#     goal.target_pose.pose.orientation.w = 1.0

#    # Sends the goal to the action server.
#     client.send_goal(goal)
#    # Waits for the server to finish performing the action.
#     wait = client.wait_for_result()
#    # If the result doesn't arrive, assume the Server is not available
#     if not wait:
#         rospy.logerr("Action server not available!")
#         rospy.signal_shutdown("Action server not available!")
#     else:
#     # Result of executing the action
#         return client.get_result()   



if __name__ == '__main__':
    rospy.init_node('move_to_beacon_action')
    server = FibonacciAction(rospy.get_name())
    rospy.spin()