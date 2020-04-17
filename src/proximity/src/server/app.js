
const express = require('express')
const app = express()
const bodyParser = require('body-parser')
const rosnodejs = require('rosnodejs');
// rosnodejs.loadAllPackages();
// support parsing of application/json type post data
app.use(bodyParser.json());

rosnodejs.initNode('my_node', { onTheFly: true })
.then(() => {
    const proximity = rosnodejs.require('proximity');
    
    app.get('/move',  (req, res) => {
      if(req.body.address){
        const ac = new rosnodejs.SimpleActionClient({
          nh: rosnodejs.nh,
          type: 'proximity/Beacon',
          actionServer: '/move_to_beacon_action'
      });
      ac.waitForServer().then(() => {
      rosnodejs.log.info('Connected to action server!');
      res.send('Going to beacon!')
      ac.sendGoal(new proximity.msg.BeaconGoal({ address: req.body.address }));
  })
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





