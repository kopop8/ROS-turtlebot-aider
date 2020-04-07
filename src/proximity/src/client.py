#! /usr/bin/env python

import rospy
import actionlib
import proximity.msg

def move_to_beacon_client():

    client = actionlib.SimpleActionClient('move_to_beacon_action', proximity.msg.BeaconAction)

    client.wait_for_server()

    goal = proximity.msg.BeaconGoal("20:91:48:5e:13:eb")

    client.send_goal(goal)

    client.wait_for_result()

    return client.get_result()

if __name__ == '__main__':
    try:

        rospy.init_node('send_beacon_client')
        result = move_to_beacon_client()
        print(result)
    except rospy.ROSInterruptException:
        print("dwa")
        # print("program interrupted before completion", file=sys.stderr)