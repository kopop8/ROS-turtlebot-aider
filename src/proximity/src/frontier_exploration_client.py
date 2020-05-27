#!/usr/bin/env python
# license removed for brevity

import rospy

# Brings in the SimpleActionClient
import actionlib
# Brings in the .action file and messages used by the move base action
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from frontier_exploration.msg import ExploreTaskAction, ExploreTaskActionGoal, ExploreTaskGoal
from geometry_msgs.msg import PointStamped
from geometry_msgs.msg import PolygonStamped
def frontier_client():

   # Create an action client called "move_base" with action definition file "MoveBaseAction"
    client = actionlib.SimpleActionClient('explore_server',ExploreTaskAction)
    rospy.loginfo("Connecting to server...")
   # Waits until the action server has started up and started listening for goals.
    client.wait_for_server()
    rospy.loginfo("Server connected!")
   # Creates a new goal with the MoveBaseGoal constructor

    goal = ExploreTaskGoal()

    goal.explore_boundary.header.stamp = rospy.Time.now()
    goal.explore_boundary.header.frame_id = 'map'
    goal.explore_boundary.polygon.points = []

    goal.explore_center.header.stamp = rospy.Time.now()
    goal.explore_center.header.frame_id = ''
    goal.explore_center.point.x = 0.0
    goal.explore_center.point.y = 0.0
    goal.explore_center.point.z = 0.0
    # maybe send explore boundary
    # goal.header.frame_id = "map"
    # goal.header.stamp = rospy.Time.now()
    # goal.goal.explore_center.point.x = 0
    # goal.goal.explore_center.point.y = 0
    # goal.goal.explore_center.point.z = 0
    # goal.goal.explore_boundary = PolygonStamped()
   # Sends the goal to the action server
    client.send_goal(goal)
    rospy.loginfo("Send goal!")
   # Waits for the server to finish performing the action.
    wait = client.wait_for_result()
   # If the result doesn't arrive, assume the Server is not available
    if not wait:
        rospy.logerr("Action server not available!")
        rospy.signal_shutdown("Action server not available!")
    else:
    # Result of executing the action
        return client.get_result()   

# If the python node is executed as main process (sourced directly)
if __name__ == '__main__':
    try:
       # Initializes a rospy node to let the SimpleActionClient publish and subscribe
        rospy.init_node('frontier_exploration_client')
        rospy.loginfo("Node inited")
        result = frontier_client()
        if result:
            rospy.loginfo("Goal execution done!")
    except rospy.ROSInterruptException:
        rospy.loginfo("Navigation test finished.")
