import AuthControllerSeller from '../controllers/authcontrollerseller.js';
import SellerController from '../controllers/sellerController.js';
import Seller from '../models/seller.js'


export default function (app) {
    let sellermgr=new Seller()
    let authController=new AuthControllerSeller();
    let sellerController=new SellerController(sellermgr)
    


    app.route('/api/allproducts')
            .post(sellerController.getAll) 
    app.route('/api/seller/deleteproducts')
            .delete(sellerController.remove)


};