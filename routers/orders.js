import OrdersController from '../controllers/ordersController.js';
import Orders from '../models/Orders.js'


export default function (app) {
    let ordermgr=new Orders()
    let ordersController=new OrdersController(ordermgr)
    


    app.route('/api/myorders')
            .get(ordersController.myorders)  
    app.route('/api/allorders')
            .get(ordersController.getAll)

    app.route('/api/editorders')
            .put(ordersController.edit)



};
