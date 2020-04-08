#!/usr/bin/env python
import rospy
import tf
import sys
from proximity.msg import RobotPosition

if __name__ == '__main__':
    # initialize node
    rospy.init_node('tf_listener')
    # print in console that the node is running
    pub = rospy.Publisher('robot_position', RobotPosition)
    # create tf listener
    listener = tf.TransformListener()
    # set the node to run 1 time per second (1 hz)
    rate = rospy.Rate(1.0)
    # loop forever until roscore or this node is down
    while not rospy.is_shutdown():
        try:
            # listen to transform
            (trans,rot) = listener.lookupTransform('/map', '/base_link', rospy.Time(0))
            temp = RobotPosition()
            temp.x = trans[0]
            temp.y = trans[1]
            temp.z = trans[2]
            temp.w = rot[3]
            # publish transform
            rospy.loginfo(trans)
            pub.publish(temp)
        except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
            continue
        # sleep to control the node frequency
        rate.sleep()