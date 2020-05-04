#! /usr/bin/env python
import rospy
import yaml
import actionlib
import proximity.msg
from beacon import Beacon
from position import Position
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal

# Action client
class MoveToBeaconAction(object):
    _feedback = proximity.msg.BeaconFeedback()
    _result = proximity.msg.BeaconResult()
    # Init the action server and connect to the movebase client
    def __init__(self, name):
        self._action_name = name
        self._as = actionlib.SimpleActionServer(self._action_name, proximity.msg.BeaconAction, execute_cb=self.execute_cb, auto_start = False)
        self._as.start()
        self._client = actionlib.SimpleActionClient('move_base',MoveBaseAction)
        rospy.loginfo('Connecting to move_base...')
        self._client.wait_for_server()
        rospy.loginfo('Server ready and waiting for action...')

    # Executes when action server gets a message.  
    def execute_cb(self, goal):
        rospy.loginfo('Got action! {}'.format(goal))
        # Executes 1 time in 1 second
        r = rospy.Rate(1)
        success = True
        # Find the correct beacon position of given address
        beacon = self.beaconFinder(goal.address)
        # If beacon is nog found give error as feedback
        if beacon == None:
            rospy.logerr("Beacon with address {} not found".format(goal.address))
            self._feedback.state = "No beacon found with that address"
            success = False
        else:
            # Beacon if found so move to beacon position.
            self._feedback.state = "Beacon found"
            result_client = self.moveToBeacon(beacon)
            if result_client:
                self._feedback.state = "Navigation done"
        # Send result beack to client.
        if success:
            self._result.result = self._feedback.state
            self._as.set_succeeded(self._result)
        else:
            self._result.result = self._feedback.state
            self._as.set_aborted(self._result)


    # Find beacons in beacons.yaml using address.
    def beaconFinder(self, address):
        with open('/home/pi/output/beacons.yaml') as f:
            # load yaml file
            dataMap = yaml.load(f,  Loader=yaml.Loader)
            for beacon in dataMap:
                # Compare addr of beacon to send address
                if str(address).lower() == str(beacon._addr).lower():
                    # if found return the beacon.
                    return beacon
            return None

    # Sends goal to the move base action server
    def moveToBeacon(self, beacon):
        # Create new goal 
        goal = MoveBaseGoal()
        goal.target_pose.header.frame_id = "map"
        goal.target_pose.header.stamp = rospy.Time.now()
        # Put the position of the found beacon in the new goal 
        goal.target_pose.pose.position.x = beacon._bestPosition._x
        goal.target_pose.pose.position.y = beacon._bestPosition._y
        goal.target_pose.pose.orientation.w = beacon._bestPosition._w
        # Send goal to move base server
        self._client.send_goal(goal)
        # Wait for the result
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