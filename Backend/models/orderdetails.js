export default class PaymentController {
    constructor(mgr){
        this.repoManager=mgr;
        }
//const sql=require('./db')

getAll=function(){
    return new Promise(resolve=>{
         let command="SELECT * FROM orderdetails";
         sql.query(command,(err, rows, fields)=>{
             resolve(rows);
         })
     }) 
 };
 
 
 getById=function(id){
     return new Promise(resolve=>{
          let command="SELECT * FROM orderdetails  WHERE id="+id;
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
         let command="INSERT INTO orderdetails() values(" + name+"','"+ email ;
         sql.query(command,(err, rows, fields)=>{
             resolve(rows);
         })
 })
 }
}
 
 exports.remove=function(id){
     return new Promise(resolve=>{
         let command="DELETE FROM orderdetails Where id="+id ;
         sql.query(command,(err, rows, fields)=>{
             resolve(rows);
         })
 })
 }