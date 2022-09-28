const mysql=require('mysql');
const conUri={
    host:'localhost',
    user:'root',
    password:'password',
    database:'ecommerce1'
};

const con=mysql.createConnection(conUri);
con.connect((err)=>{
    if(err){
        console.log("connect with mysql DB");
    }
    else{
        console.log(err);
    }
});
module.exports=con;