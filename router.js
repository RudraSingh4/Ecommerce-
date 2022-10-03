var accountController=require('./controllers/accountcontroller');
var categoryController=require('./controllers/categorycontroller');
var customerController=require('./controllers/customercontroller');
var deliveryController=require('./controllers/deliverycontroller');


module.exports=function(app){
    app.route('/api/accountss')
       .get(accountController.getAll)  
       .post(accountController.insert);
            
    app.route('/api/accounts/:id')
       .delete(accountController.remove)  
       .put(accountController.accountupdate)   
       .get(accountController.getById) ; 

   

  app.route('/api/categories')
     .get(categoryController.getAll)  
     .post(categoryController.insert); 
            
  app.route('/api/categories/:id')
     .delete(categoryController.remove)  
     .put(categoryController.categoriesupdate)   
    .get(categoryController.getById);
       
       
    app.route('/api/customers')
       .get(customerController.getAll)
       .post(customerController.insert);

   app.route('/api/categories/:id')
     .delete(categoryController.remove)  
     .put(categoryController.categoriesupdate)   
     .get(categoryController.getById) ;   
};




