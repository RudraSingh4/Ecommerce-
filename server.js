import express from 'express'
import expressSession from 'express-session';
import userRoutes from './router/users.js';
//import categoriesRoutes from './router/admin.js'
//import vendorRoutes from './router/vendors.js'
import sellerRoutes from './router/seller.js';
const app=express();
import cors from 'cors';
app.use(cors());

//const express=require('express');
//const { clearScreenDown } = require('readline');
//const routes=require('./router');
//var path=require('path');
app.use(express.urlencoded({extended:true}));

app.use(express.json());
app.listen(3000,()=>{
    console.log("App server is listening on port 3000");
})