export default class PaymentController {
    constructor(mgr){
        this.repoManager=mgr;
        }
//const sql = require('./db');

getAll=function(){
    return new Promise(resolve=>{
         let command="SELECT * FROM orders";
         sql.query(command,(err, rows, fields)=>{
             resolve(rows);
         })
     }) 
 };
 
 
 getById=function(id){
     return new Promise(resolve=>{
          let command="SELECT * FROM orders  WHERE id="+id;
          sql.query(command,(err, rows, fields)=>{
              resolve(rows);
          })
      }) 
  };
 
  
 
 insert=function(req){
     return new Promise(resolve=>{
         let name=req.body.name;
         let location=req.body.location;
         let email=req.body.email;
         let command="INSERT INTO orders() values(" + name+"','"+ email ;
         sql.query(command,(err, rows, fields)=>{
             resolve(rows);
         })
 })
 }
}
 
 exports.remove=function(id){
     return new Promise(resolve=>{
         let command="DELETE FROM orders Where id="+id ;
         sql.query(command,(err, rows, fields)=>{
             resolve(rows);
         })
 })
 }