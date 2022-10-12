import AuthControllerUser from '../controllers/authcontrollerUser.js';
import UserController from '../controllers/usercontroller.js';
import Users from '../models/users.js'

//HTTP request mapping is done using routing technique
export default function (app) {
        let mgr=new Users();
        let userController=new UserController(mgr);
        let authController=new AuthControllerUser();

        app.route('/api/users')
                .get(userController.getAll)  // get all tasks
                .post(userController.insert)
                .put(userController.update)
        app.route('/api/users/:id')
                .delete(userController.remove)
                .get(userController.getById)


        app.route('/api/users/login')
                .post(authController.login);
        app.route('/api/users/register')
                .post(authController.register);




};



