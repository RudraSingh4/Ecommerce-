export default class PaymentController {
  constructor(mgr){
      this.repoManager=mgr;
      }

//const { response } = require('express');
//const dal=require('../models/customers')

getAll= async function(req, res){  
  let result=[];
  console.log("Result")
  result=await dal.getAll();
  console.log(result)
  res.send(result); 
};

getById= async function(req, res){  
  let result=[];
  result=await dal.getById(req.params.id);
  res.send(result); 
};

insert=async(req, res)=>{
  let result=[];
  result=await dal.insert(req);
  res.send(result);
  };

remove=async (req, res)=>{
      let result=[];
      result=await dal.remove(req.params.id)
      res.send(result);
};
}