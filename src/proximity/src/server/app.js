
const express = require('express')
const app = express()
const bodyParser = require('body-parser')
const rosnodejs = require('rosnodejs');
app.use(bodyParser.json());

//  Init server node
rosnodejs.initNode('server', { onTheFly: true })
.then(() => {
    const proximity = rosnodejs.require('proximity');
    // Route to move robot
    app.post('/move',  (req, res) => {
      if(req.body.address){
          console.log(req.body.address)
      // Connect to SimpleActionServer
      const ac = new rosnodejs.SimpleActionClient({
          nh: rosnodejs.nh,
          // the type puts ActionGoal in the end automatically
          type: 'proximity/Beacon',
          actionServer: '/move_to_beacon_action'
      });
      // Wait for it to connect
      ac.waitForServer().then(() => {
      rosnodejs.log.info('Connected to action server!');
      // Send goal to server
      ac.sendGoal(new proximity.msg.BeaconGoal({ address: req.body.address }))
      res.status(200).send('Robot going to goal')
  })
      } else {
        res.status(403).send('Expected address')
      }
    });
    // Change the 404 message modifing the middleware
    app.use((req, res, next) => {
        res.status(404).send("Sorry, that route doesn't exist.")
    });

    // start the server in the port 3000 !
    app.listen(3000, () => {
        console.log('Example app listening on port 3000.')
    });

});





