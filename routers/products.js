import AuthControllerSeller from '../controllers/authcontrollerseller.js';
import SellerController from '../controllers/sellerController.js';
import Seller from '../models/seller.js'


export default function (app) {
    let sellermgr=new Seller()
    let authController=new AuthControllerSeller();
    let sellerController=new SellerController(sellermgr)
    


    app.route('/api/seller/addproducts')
            .post(sellerController.insert) 
    app.route('/api/seller/deleteproducts')
            .delete(sellerController.remove)

    app.route('/api/seller/editproducts')
            .put(sellerController.edit)


    app.route('/api/seller/myproducts')
            .post(sellerController.myproducts)




    app.route('/api/seller/login')
            .post(authController.login);
    app.route('/api/seller/register')
            .post(authController.register);

};