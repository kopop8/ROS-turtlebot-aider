
const express = require('express')
const app = express()
const bodyParser = require('body-parser')
const rosnodejs = require('rosnodejs');
// rosnodejs.loadAllPackages();
// support parsing of application/json type post data
app.use(bodyParser.json());

rosnodejs.initNode('my_node', { onTheFly: true })
.then(() => {
  //   const proximity = rosnodejs.require('proximity');
  //   const goal = new proximity.msg.BeaconGoal({ address: 'Hello' });
  //   const ac = new rosnodejs.SimpleActionClient({
  //       nh: rosnodejs.nh,
  //       type: proximity.msg.BeaconAction,
  //       actionServer: 'move_to_beacon_action'
  //   });
  //   ac.waitForServer()
  // .then(() => {
  //   rosnodejs.log.info('Connected to action server!');
  // })


    app.get('/move',  (req, res) => {
      if(req.body.address){
      const pub = rosnodejs.nh.advertise('/send_beacon_client', 'std_msgs/String');
      pub.publish({ data: req.body.address });
      res.send('Going to beacon!')
      } else {
        res.status(403).send('Expected address')
      }
    });
    // Change the 404 message modifing the middleware
    app.use((req, res, next) => {
        res.status(404).send("Sorry, that route doesn't exist. Have a nice day :)")
    });

    // start the server in the port 3000 !
    app.listen(3000, () => {
        console.log('Example app listening on port 3000.')
    });

});





