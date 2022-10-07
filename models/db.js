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
        console.log(err);
    }
    else{
        console.log("Connection Succesfull");
    }
});
module.exports=con;