#! /usr/bin/env python

import rospy
import actionlib
import proximity.msg
from std_msgs.msg import String


def move_to_beacon_client(data):
    rospy.loginfo('Got address {}'.format(data.data))
    client = actionlib.SimpleActionClient('move_to_beacon_action', proximity.msg.BeaconAction)

    client.wait_for_server()

    # goal = proximity.msg.BeaconGoal("20:91:48:5e:13:eb")
    goal = proximity.msg.BeaconGoal(str(data.data))

    client.send_goal(goal)

    client.wait_for_result()

    return client.get_result()

if __name__ == '__main__':
    try:

        rospy.init_node('send_beacon_client')
        # result = move_to_beacon_client()
        rospy.loginfo("Client ready and waiting for action...")
        rospy.Subscriber("send_beacon_client", String, move_to_beacon_client)
        rospy.spin()
    except rospy.ROSInterruptException:
        print("rospy.ROSInterruptExceptio")