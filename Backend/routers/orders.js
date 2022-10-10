import OrdersController from '../controllers/orderscontroller.js';
import Orders from '../models/Orders.js'


export default function (app) {
    let ordermgr=new Orders()
    let orderscontroller=new OrdersController(ordermgr)
    


    app.route('/api/myorders/:id')
            .get(orderscontroller.getById)  
    app.route('/api/allorders')
            .get(orderscontroller.getAll)

    app.route('/api/insertorders')
            .put(orderscontroller.insert)
};
