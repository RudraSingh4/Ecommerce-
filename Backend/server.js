import express from 'express'
import expressSession from 'express-session';
import ordersRoutes from './routers/orders.js';
//import paymentRoutes from './routers/payment.js'
                                        //import vendorRoutes from './router/vendors.js'
//import sellerRoutes from './router/seller.js';
const app=express();
import cors from 'cors';
app.use(cors());


//const express=require('express');
//const { clearScreenDown } = require('readline');
//const routes=require('./router');
//var path=require('path');
app.use(express.urlencoded({extended:true}));
app.use(express.json());
//categoriesRoutes(app);
ordersRoutes(app)
                                               //vendorRoutes(app)
//sellerRoutes(app)
app.get('/user/register',(req,res)=>{
    res.render("../views/register")
})
app.get('/user/login',(req,res)=>{
    res.render("../views/userLogin")
})
app.listen(3000,()=>{
    console.log("App server is listening on port 3000");
})