import AuthControllerSeller from '../controllers/authcontrollerseller.js';
import shipperController from '../controllers/shipperController.js';
import shipper from '../models/shippers.js';


export default function (app) {
    let shippersmgr=new shippers()
    let authController=new AuthControllerSeller();
    let shippersController=new shippersController(shippersmgr)
    


    app.route('/api/payment')
            .post(shippersController.insert)
    app.route('/api/payment')
            .delete(shippersController.remove)

};