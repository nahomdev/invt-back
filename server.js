const express = require("express")
const cors = require("cors");
const morgan = require("morgan")
const dotenv = require('dotenv')
const path = require('path')

const app = express();
dotenv.config({path:path.join(__dirname,'.env')});
app.use(cors());
app.use(morgan('dev'));
app.use(express.json());

app.get('/test',(req, res ,next)=>{
    res.send("test api response");
})
// order_id
//the order_id from the machine and the order of the other can not be the same it shouldn't work
//after the order_id confirmed the Observation code must be found and compared so that it should be able to
//update the result observation then it will be successful
// 

const port = process.env.EXPRESS_PORT;

app.listen(port, ()=>{
    console.log(`server is up and running on port ${port}`)
});