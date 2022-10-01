var sql = require('./db');

var User=function(users){
    this.username=users.username;
    this.password=users.password;
    this.contactnumber=users.contactnumber;
    this.email=users.email;
    this.question=users.question;
    this.answer=users.answer;
    this.role=users.role;


};




module.exports=User;