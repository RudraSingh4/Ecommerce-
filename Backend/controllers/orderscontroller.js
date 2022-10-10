export default class PaymentController {
  constructor(mgr){
      this.repoManager=mgr;
      }

//var Orders = require('../model/ordersdal');

getAll = function(req, res) {
  Orders.getAllOrder(function(err, orders) {
    if (err)
      res.send(err);
    res.send(orders);
  });
};

insert = function(req, res) {
  
  var new_order= new Orders(req.body);
  let customerid=new_order.customerid;
  if (err)
  res.send(err);
res.send(orders);
}
  //handles null error 
  //  if(!new_order.order || !new_order.status){
  //     res.status(400).send({ error:true, message: 'Please provide order/status' });
  //   }
  //  else{

   /*createOrder(customerid, function(err, order) {
      if (err)
      res.send(err);
    res.json(order);
    });
  };*/

getById = function(req, res) {
  Orders.getOrderById(req.params.orderid, function(err, order) {
    if (err)
      res.send(err);
    res.json(order);
  });
};

/*update = function(req, res) {
  Orders.updateById(req.params.taskId, new Orders(req.body), function(err, order) {
    if (err)
      res.send(err);
    res.json(order);
  });
};

remove = function(req, res) {
  Orders.remove( req.params.orderid, function(err, order) {
    if (err)
      res.send(err);
    res.json({ message: 'Orders successfully deleted' });
  });
};*/
}