const express=require('express');
const { clearScreenDown } = require('readline');
const routes=require('./router');
//var path=require('path');

var app=express();
routes(app)


app.use(express.urlencoded({extended:true}));

app.use(express.json());
app.listen(3000,()=>{
    console.log("App server is listening on port 3000");
})