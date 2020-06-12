# ROS-turtlebot-aider
## To build
```catkin_make```

## Make a map
We first need to make a map with bluetooth beacons.
### Frontier exploration mapper [Robot]
Run mapper ```roslaunch proximity frontier_mapper.launch```
### Manual mapper [Robot]
Run mapper ```roslaunch proximity mapper.launch```
Save map ```rosrun map_server map_saver -f gridmap```


## Setup project
We now have a map with bluetooth beacons now we need to start the server and robot than we are ready to go!
### Server [PC]
First install node modules in server map ```npm install```
run server in server map: ```node app.js```
### Setup robot [Robot]
run server: ```roslaunch server_robot.launch```
You can now send an emergency signal to the robot! The robot will drive to the closest beacon.
