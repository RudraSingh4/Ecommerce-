var usercontroller=require('../controllers/usercontroller');
module.exports=function(app){
    app.route('/api/user')
.get(usercontroller.getAll)
.post(usercontroller.insert);

}
