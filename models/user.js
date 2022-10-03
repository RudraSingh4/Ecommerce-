



User.createTask = function (new_task, result) {    
    sql.query("INSERT INTO users set ?", new_task, function (err, res) {
            if(err) {
              console.log("error: ", err);
              result(err, null);
            }
            else{
              console.log(res.insertId);
              result(null, res.insertId);
            }
        });           
};
User.getAllTask = function (result) {
  sql.query("select * from users", function (err, res) {
          if(err) {
            console.log("error: ", err);
            result(null, err);
          }
          else{
            console.log('users : ', res);  
            result(null, res);
          }
      });   
};
module.exports=User;