import AdminController from '../controllers/adminController.js';
import UserController from '../controllers/usercontroller.js';
import Admin from '../models/admin.js'
import Users from '../models/users.js'
//HTTP request mapping is done using routing technique
export default function (app) {
    let adminmgr=new Admin()
    let usermgr=new Users();
    let userController=new UserController(usermgr);
    let categoriesController=new AdminController(adminmgr);
 

    app.route('/api/categories')
        .get(categoriesController.getAll)
        .post(categoriesController.insert)

    app.route('/api/categories/:id')
        .delete(categoriesController.remove)
        .get(categoriesController.getById)
        .post(categoriesController.postById)
    app.route('/api/products')
        .get(categoriesController.getAllProducts)
        .put(categoriesController.update)
    app.route('/api/admin/users')
        .get(userController.getAll)
    app.route('/api/sellers')
        .get(userController.getALLsellers)
    app.route('/api/vendors')
        .get(userController.getALLvendors)
};