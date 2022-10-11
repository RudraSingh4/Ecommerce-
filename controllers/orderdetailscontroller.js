export default class orderdetailsController {
  constructor(mgr){
      this.repoManager=mgr;
      }
//var Orderdetail = require('../model/orderdetails');

getAll = function(req, res) {
  Orderdetail.getAllOrderdetails(function(err, orderdetails) {
    if (err)
      res.send(err);
    res.send(orderdetails);
  });
};

insert = function(req, res) {
  
  var new_order= new Orderdetail(req.body);
  let customerid=new_order.customerid;
  //handles null error 
  //  if(!new_order.order || !new_order.status){
  //     res.status(400).send({ error:true, message: 'Please provide order/status' });
  //   }
  //  else{

    createOrder(customerid, function(err, order) {
      if (err)
      res.send(err);
    res.json(order);
    });
  };

getBy = function(req, res) {
  Orderdetail.getOrderdetailsById(req.params.orderdetailid, function(err, orderdetails) {
    if (err)
      res.send(err);
    res.json(orderdetails);
  });
};

update = function(req, res) {
  Orderdetail.updateById(req.params.orderdetailId, new Orderdetail(req.body), function(err, orderdetails) {
    if (err)
      res.send(err);
    res.json(orderdetails);
  });
};

remove = function(req, res) {
  Orderdetail.remove( req.params.orderid, function(err, orderdetails) {
    if (err)
      res.send(err);
    res.json({ message: 'Orderdetail successfully deleted' });
  });
};
}