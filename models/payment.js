const sql=require('./db');

exports.getAll=function(){
    return new Promise(resolve=>{
         let command="SELECT * FROM paymentts";
         sql.query(command,(err, rows, fields)=>{
             resolve(rows);
         })
     }) 
 };
 
 
 exports.getById=function(id){
     return new Promise(resolve=>{
          let command="SELECT * FROM payments  WHERE id="+id;
          sql.query(command,(err, rows, fields)=>{
              resolve(rows);
          })
      }) 
  };
 
  
 
 exports.insert=function(req){
     return new Promise(resolve=>{
         let name=req.body.name;
         let location=req.body.location;
         let email=req.body.email;
         let command="INSERT INTO payments() values(" + name+"','"+ email ;
         sql.query(command,(err, rows, fields)=>{
             resolve(rows);
         })
 })
 }
 
 exports.remove=function(id){
     return new Promise(resolve=>{
         let command="DELETE FROM payments Where id="+id ;
         sql.query(command,(err, rows, fields)=>{
             resolve(rows);
         })
 })
 }