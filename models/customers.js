export default class PaymentController {
    constructor(mgr){
        this.repoManager=mgr;
        }
//const sql = require('./db');

getAll=function(){
  return new Promise(resolve=>{
       let command="SELECT * FROM customers";
       sql.query(command,(err, rows, fields)=>{
        console.log(rows)
           resolve(rows);
       })
   }) 
};


getById=function(id){
   return new Promise(resolve=>{
        let command="SELECT * FROM customers  WHERE id="+id;
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
       let command="INSERT INTO customers() values(" + name+"','"+ email ;
       sql.query(command,(err, rows, fields)=>{
           resolve(rows);
       })
})
}
}

exports.remove=function(id){
   return new Promise(resolve=>{
       let command="DELETE FROM customers Where id="+id ;
       sql.query(command,(err, rows, fields)=>{
           resolve(rows);
       })
})
}