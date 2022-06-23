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



const port = process.env.EXPRESS_PORT;

app.listen(port, ()=>{
    console.log(`server is up and running on port ${port}`)
});