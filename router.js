var accountController=require('./controllers/accountcontroller');
var categoryController=require('./controllers/categoriescontroller');
var customerController=require('./controllers/customerscontroller');
var deliveryController=require('./controllers/deliverycontroller');


module.exports=function(app){
    app.route('/api/accounts')
       .get(accountController.getAll)  
       .post(accountController.insert);
            
    app.route('/api/accounts/:id')
       .delete(accountController.remove)    
       .get(accountController.getById) ; 

   

  app.route('/api/categories')
     .get(categoryController.getAll)  
     .post(categoryController.insert); 
            
  app.route('/api/categories/:id')
     .delete(categoryController.remove)     
    .get(categoryController.getById);
       
       
    app.route('/api/customers')
       .get(customerController.getAll)
       .post(customerController.insert);

   app.route('/api/categories/:id')
     .delete(categoryController.remove)     
     .get(categoryController.getById) ;   
};




