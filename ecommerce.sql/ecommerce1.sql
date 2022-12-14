create database ecommerce;
use ecommerce;


CREATE TABLE roles (roleid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,  title VARCHAR(25));

CREATE TABLE categories(categoryid INT NOT NULL AUTO_INCREMENT PRIMARY KEY, title VARCHAR(50) NOT NULL,picture VARCHAR (100) NOT NULL );

CREATE TABLE accounts(accountid  INT NOT NULL PRIMARY KEY AUTO_INCREMENT, balance FLOAT);
CREATE TABLE users(userid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,username varchar(200),password VARCHAR(100) NOT NULL,contactnumber varchar(10),email varchar(255) NOT NULL, question VARCHAR(255),answer VARCHAR(255), role varchar(100));

CREATE TABLE suppliers(supplierid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,organization VARCHAR(100) NOT NULL,location VARCHAR(100) NOT NULL,
		        email VARCHAR(50) NOT NULL,contactnumber VARCHAR(10) NOT NULL, discounttype VARCHAR(50) NOT NULL,
				accountid INT NOT NULL,
                userid INT NOT NULL,
                CONSTRAINT fk_supplierusers FOREIGN KEY(userid) REFERENCES users(userid),
			    CONSTRAINT fk_supplieraccounts FOREIGN KEY(accountid) REFERENCES accounts(accountid));


CREATE TABLE products(productid INT NOT NULL AUTO_INCREMENT PRIMARY KEY, title VARCHAR(50) NOT NULL, picture VARCHAR(300) NOT NULL, description VARCHAR(300) NOT NULL,
 			unitprice INT NOT NULL,available BOOL NOT NULL,categoryid INT NOT NULL,supplierid INT NOT NULL,
			CONSTRAINT fk_productscategories FOREIGN KEY(categoryid) REFERENCES categories(categoryid),unitinstock INT NOT NULL, 
			CONSTRAINT fk_productssupplier FOREIGN KEY(supplierid) REFERENCES suppliers(supplierid));








CREATE TABLE shippers(shipperid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,userid INT NOT NULL,
                       email VARCHAR(200) NOT NULL, contactnumber VARCHAR(10) NOT NULL, organization VARCHAR(50),
						CONSTRAINT fk_usersshippers FOREIGN KEY(userid) REFERENCES users(userid));



CREATE TABLE customers(customerid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,firstname VARCHAR(100) NOT NULL,lastname VARCHAR(100),
			email VARCHAR(100) NOT NULL,contactnumber VARCHAR(10),address VARCHAR(255),
            roleid INT NOT NULL, accountid INT NOT NULL,userid INT NOT NULL,
            CONSTRAINT fk_customersusers FOREIGN KEY(userid) REFERENCES users(userid),
			CONSTRAINT fk_customeraccounts FOREIGN KEY(accountid) REFERENCES accounts(accountid));
           
CREATE TABLE orders (orderid INT NOT NULL PRIMARY KEY AUTO_INCREMENT, orderdate DATETIME DEFAULT CURRENT_TIMESTAMP, status VARCHAR(20), customerid INT NOT NULL,
			CONSTRAINT fk_orderscustomers FOREIGN KEY(customerid) REFERENCES customers(customerid));




CREATE TABLE orderdetails (orderdetailid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
			  orderid INT NOT NULL, productid INT NOT NULL, quantity INT,
			  CONSTRAINT fk_orderdetailsorders FOREIGN KEY (orderid) REFERENCES orders(orderid),
              CONSTRAINT fk_orderdetailsproducts FOREIGN KEY (productid) REFERENCES products(productid));

CREATE TABLE deliveries(deliveryid INT NOT NULL PRIMARY KEY AUTO_INCREMENT, status VARCHAR(200) NOT NULL, orderid INT NOT NULL,shipperid INT NOT NULL,
			CONSTRAINT fk_deliveryorders FOREIGN KEY(orderid) REFERENCES orders(orderid),
			CONSTRAINT fk_deliveryshippers FOREIGN KEY(shipperid) REFERENCES shippers(shipperid));


CREATE TABLE ledger(transactionid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,transactiondate DATETIME DEFAULT CURRENT_TIMESTAMP ,accountid INT, amount INT, paymentmode VARCHAR(50),
operation VARCHAR(1) NOT NULL,
			CONSTRAINT fk_ledgeraccounts FOREIGN KEY(accountid) REFERENCES accounts(accountid));
            
CREATE TABLE payments(paymentid INT NOT NULL PRIMARY KEY AUTO_INCREMENT, paymentdate DATETIME DEFAULT CURRENT_TIMESTAMP,orderid INT, amount float, paymentmode varchar(50),transactionid  INT NOT NULL,
			CONSTRAINT fk_paymentstransactions FOREIGN KEY(transactionid) REFERENCES ledger(transactionid),
			CONSTRAINT fk_paymentsorders FOREIGN KEY(orderid) REFERENCES orders(orderid));







INSERT INTO categories(title,picture) VALUES ("Electronics","/assets/images/Laptop.jpg"); 
INSERT INTO categories(title,picture) VALUES ("Clothing","/assets/images/shirt.jpg");  
INSERT INTO categories(title,picture) VALUES ("Toys","/assets/images/teddy.jpg");   
INSERT INTO categories(title,picture) VALUES ("Flowers","/assets/images/Rose.jpg"); 
INSERT INTO categories(title,picture) VALUES ("Fruits","/assets/images/Apple.jpg"); 
INSERT INTO categories(title,picture) VALUES ("Vegetables","/assets/images/Potatoes.jpg");


INSERT INTO accounts(accountid,balance) VALUES(1,12000); 
INSERT INTO accounts(accountid,balance) VALUES(2,10000); 
INSERT INTO accounts(accountid,balance) VALUES(3,8000); 
INSERT INTO accounts(accountid,balance) VALUES(4,7000); 
INSERT INTO accounts(accountid,balance) VALUES(5,12000); 
INSERT INTO accounts(accountid,balance) VALUES(6,10000); 
INSERT INTO accounts(accountid,balance) VALUES(7,8000); 
INSERT INTO accounts(accountid,balance) VALUES(8,7000); 
INSERT INTO accounts(accountid,balance) VALUES(9,8000); 



INSERT INTO roles(title)VALUES("customer"); 
INSERT INTO roles(title)VALUES("bod"); 
INSERT INTO roles(title)VALUES("staff"); 
INSERT INTO roles(title)VALUES("supplier"); 
INSERT INTO roles(title)VALUES("vendors"); 
INSERT INTO roles(title)VALUES("shippers"); 
INSERT INTO roles(title)VALUES("sells"); 
INSERT INTO roles(title)VALUES("marketing"); 
INSERT INTO roles(title)VALUES("accounting");




INSERT INTO users(username,password,contactnumber,email,question,answer,role) VALUES("abhi","1234","9882437123","abhishekbhoranj@gmail.com","what is ur favourite books","panchtantra","user"); 
INSERT INTO users(username,password,contactnumber,email,question,answer,role)VALUES("akash","ak123","9882437124","akash886@gmail.com","what is ur favourite movie","jamesbond","user"); 
INSERT INTO users(username,password,contactnumber,email,question,answer,role)VALUES("imtiaz","peek","9882437125","imtiaz67575@gmail.com","what is ur favourite game","cricket","user"); 
INSERT INTO users(username,password,contactnumber,email,question,answer,role)VALUES("ruchi","seed","9882437128","ruchi64@gmail.com","what is ur favourite snacks","lays","user");
INSERT INTO users(username,password,contactnumber,email,question,answer,role)VALUES("ashish","kiit","9882437126","ashishhh@gmail.com","who is ur favourite singer ","ar.rahman","user"); 
INSERT INTO users(username,password,contactnumber,email,question,answer,role)VALUES("ritu","morning","9882437127","ritu67868@gmail.com","what is ur favourite books","3 idiots","user"); 
INSERT INTO users(username,password,contactnumber,email,question,answer,role)VALUES("ujwal","fresh","9882437128","ujwal876876@gmail.com","what is ur favourite movie","rees",7); 
INSERT INTO users(username,password,contactnumber,email,question,answer,role)VALUES("chirinjib","shine","9882437122","chir654@gmail.com","what is ur favourite cartoon","mrbean","user"); 
INSERT INTO users(username,password,contactnumber,email,question,answer,role)VALUES("akhand","fresh","9882437121","akhand867896@gmail.com","what is ur favourite actor","shahrukhkhan","user"); 
INSERT INTO users(username,password,contactnumber,email,question,answer,role)VALUES("prashant","fresh","9882437120","prashant675@gmail.com","what is ur favourite pet ","dog","user"); 



INSERT INTO suppliers( organization,location,email,contactnumber,discounttype,accountid,userid) VALUES("Samsung Electronics", "Punjab","samsungelectronics@gmail.com","1234567890","20% off",2,2);
INSERT INTO suppliers( organization,location,email,contactnumber,discounttype,accountid,userid) VALUES("Myntra", "Bombay","myntra.123@gmail.com","123867890","60% off",3,4);
INSERT INTO suppliers( organization,location,email,contactnumber,discounttype,accountid,userid) VALUES("flipkart", "Delhi","flipkart@gmail.com","123856790","30% off",5,1);
INSERT INTO suppliers( organization,location,email,contactnumber,discounttype,accountid,userid) VALUES("Transflower", "Pune","transflower@gmail.com","6543789790","50% off",1,3);
INSERT INTO suppliers( organization,location,email,contactnumber,discounttype,accountid,userid) VALUES("Fruits Company", "Bangalore","fruits.234@gmail.com","987656790","10% off",4,5);
INSERT INTO suppliers( organization,location,email,contactnumber,discounttype,accountid,userid) VALUES("Blinkit", "Delhi","blinkit@gmail.com","976356790","30% off",5,1);



INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("Television","/assets/images/Television.jpg", "best televiosn in market with good disply and speaker quality",18000, 1,1,1,400);
INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("Radio","/assets/images/Radio.jpg", "best radio in market with good speaker quality",1000, 1,1,1,800);
INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("Camera","/assets/images/Camera.jpg", "best camera in market",10000, 1,1,1,500);
INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("Speaker","/assets/images/Speaker.jpg", "best speaker in market with good sound quality",5000, 0,1,1,0);
INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("Laptop","/assets/images/Laptop.jpg", "best laptop in market ",50000, 1,1,1,100);

INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("shirt","/assets/images/shirt.jpg", "Dri-fit fabric keeps away sweat to help keep you comfortable and dry",5000,1, 1,1,1500);
INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("Saree","/assets/images/Saree.jpg", "Banarasi Cotton Silk Saree ",20000, 1,2,2,500);
INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("Track Pants","/assets/images/Trackpants.jpg", "Solid Men Black Track Pants",550, 1,2,2,2000);
INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("Jeans","/assets/images/Jeans.jpg", "Slim Men Grey Jeans",1200, 0,2,2,0);
INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("Salwar Suit","/assets/images/Salwarsuit.jpg", "Unstitched Crepe Salwar Suit Material Printed",1400, 1,2,2,600);


INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("teddy bear","/assets/images/teddy.jpg", "best and smooth teddy bear for your child",200, 1,3,3,5220);
INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("Ludo Gag","/assets/images/ludoGag.jpg", "TRENDY&HANDY Toy ludo Gag Toy",100, 0,3,3,0);
INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("Toys TAXI","/assets/images/TAXI.jpg", "A R ENTERPRISES TOY VIP TAXI",600, 1,3,3,3000);
INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("Toys Bike","/assets/images/Bike.jpg", "Toyshack Metal Die Cast Bike",500, 1,3,3,1000);
INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("Girl Doll","/assets/images/Girldoll.jpg", "Sheny Happy Girl Doll Series With Doll Dresses Set For Kids",300, 1,3,3,500);

INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("Lotus","/assets/images/Lotus.jpg", "God worship flower ",10, 1,4,4,200); 
INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("Marigold","/assets/images/Marigold.jpg", "Festival Flower ",15, 1,4,4,100); 
INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("Rose","/assets/images/Rose.jpg", "Valentine Flower ",20, 1,4,4,500); 
INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("Jasmine","/assets/images/Jasmine.jpg", "Smelling Flower",25, 1,4,4,400); 
INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("Lily","/assets/images/Lily.jpg", "Eucharis, Amazon Lily - Plant",05, 0,4,4,0); 

INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("apple fruit","/assets/images/Apple.jpg", "Apples have been linked to numerous health benefits ",15, 0,5,5,0);
INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("Banana fruit","/assets/images/Banana.jpg", "The fruits grow upward in clusters near the top of the plant.",10, 1,5,5,250);
INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("pineapple fruit","/assets/images/Pineapple.jpg", "a sweet tropical fruit with a tough leathery skin and spiky leaves on top",20, 1,5,5,350);
INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock)  
values ("strawberry fruit","/assets/images/Strawberry.jpg", " a small red fruit which is soft and juicy and has tiny yellow seeds on its skin ",25, 1,5,5,400);
INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("guava fruit","/assets/images/Guava.jpg", "The fruits are round to pear-shaped",12, 1,5,5,450);

INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("Potatoes","/assets/images/Potatoes.jpg", "Potatoes are more energy-packed than any other popular Vegetables",5, 0,6,6,0);
INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("Cauliflowers","/assets/images/Cauliflowers.jpg", "annual plants that reach about 0.5 metre (1.5 feet) tall and bear large rounded leaves that resemble collards",10, 1,6,6,2000); 
INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("Brinjal","/assets/images/Brinjal.jpg", "Brinjal is classified as a herb because of its non-woody stem",7, 1,6,6,200); 
INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("Pointed Gourd ","/assets/images/Pointedgourd .jpg", "it is pointed ends on both sides and is thick in middle which is green in colour",12, 0,6,6,0); 
INSERT INTO products(title,picture,description,unitprice,available,categoryid,supplierid,unitinstock) 
values ("Tomato ","/assets/images/Tomato .jpg", "tomato should be classified as a vegetable on the basis of its culinary applications",9, 1,6,6,500); 






INSERT INTO 
customers(firstname,lastname,email,contactnumber,address,roleid,accountid,userid) VALUES( "Sourav", "Behera", "souravbehera@gmail.com", "9937094574", "Odisha",1,2,1); INSERT INTO 
customers(firstname,lastname,email,contactnumber,address,roleid,accountid,userid) VALUES ("Nilu", "Patra","nilu@gmail.com", "8637241506", "Gujrat",2,1,2); 
INSERT INTO 
customers(firstname,lastname,email,contactnumber,address,roleid,accountid,userid) VALUES( "Ram", "Behera", "rbehera@gmail.com","7751069731", "Delhi",3,4,3 ); 
INSERT INTO customers 
(firstname,lastname,email,contactnumber,address,roleid,accountid,userid)VALUES( "Payal", "Patra", "payalpatra@gmail.com", "992415671", "Maharashtra",4,6,4 ); 
INSERT INTO customers 
(firstname,lastname,email,contactnumber,address,roleid,accountid,userid)VALUES( "Rahul", "Das", "rdas@gmail.com","8244605084", "Odisha",5,7,5); 
INSERT INTO customers 
(firstname,lastname,email,contactnumber,address,roleid,accountid,userid)VALUES( "Raj", "Singh", "rajsingh@gmail.com","8294605084", "Jaipur",6,8,6); 
INSERT INTO customers 
(firstname,lastname,email,contactnumber,address,roleid,accountid,userid)VALUES( "Ruhi", "Sharma", "ruhi@gmail.com","8274605084", "Indore",7,3,7); 
INSERT INTO customers 
(firstname,lastname,email,contactnumber,address,roleid,accountid,userid)VALUES( "Virat", "Kohli", "kohli@gmail.com","9244605084", "Bombay",8,5,8); 
INSERT INTO customers 
(firstname,lastname,email,contactnumber,address,roleid,accountid,userid)VALUES( "Rahul", "Dravid", "rdravid@gmail.com","9844605084", "Kerala",9,10,9); 






INSERT INTO shippers(shipperid,userid,email,contactnumber,organization)VALUES(1,3,"ap@gmail.com","1234567890","ekart");
INSERT INTO shippers(shipperid,userid,email,contactnumber,organization)VALUES(2,4,"vk@gmail.com","1234567891","meesho");
INSERT INTO shippers(shipperid,userid,email,contactnumber,organization)VALUES(3,5,"sr@gmail.com","1234567892","ajio");
INSERT INTO shippers(shipperid,userid,email,contactnumber,organization)VALUES(4,6,"rs@gmail.com","1234567893","flipkart");
INSERT INTO shippers(shipperid,userid,email,contactnumber,organization)VALUES(5,7,"aj@gmail.com","1234567894","amazon");
INSERT INTO shippers(shipperid,userid,email,contactnumber,organization)VALUES(6,8,"si@gmail.com","1234567895","myntra");
INSERT INTO shippers(shipperid,userid,email,contactnumber,organization)VALUES(7,9,"rp@gmail.com","1234567896","ekart");
INSERT INTO shippers(shipperid,userid,email,contactnumber,organization)VALUES(8,10,"sd@gmail.com","1234567897","ajio");
INSERT INTO shippers(shipperid,userid,email,contactnumber,organization)VALUES(9,11,"ar@gmail.com","1234567898","ekart");
INSERT INTO shippers(shipperid,userid,email,contactnumber,organization)VALUES(10,12,"sd@gmail.com","1234567899","meesho");


 




INSERT INTO orders(orderdate,status,customerid) VALUES ("2022-05-19 08:18:17","inprocess",1);
INSERT INTO orders(orderdate,status,customerid) VALUES ("2021-05-19 09:19:17","inprocess",2);
INSERT INTO orders(orderdate,status,customerid) VALUES ("2020-05-19 10:12:17","inprocess",3);
INSERT INTO orders(orderdate,status,customerid) VALUES ("2020-05-19 11:19:17","inprocess",4);
INSERT INTO orders(orderdate,status,customerid) VALUES ("2021-05-19 12:12:17","inprocess",5);
INSERT INTO orders(orderdate,status,customerid) VALUES ("2022-05-19 13:18:17","inprocess",6);
INSERT INTO orders(orderdate,status,customerid) VALUES ("2021-05-19 14:19:17","inprocess",7);
INSERT INTO orders(orderdate,status,customerid) VALUES ("2020-05-19 15:12:17","inprocess",8);
INSERT INTO orders(orderdate,status,customerid) VALUES ("2020-05-19 16:19:17","inprocess",9);







INSERT INTO orderdetails(orderid,productid,quantity) VALUES (1,1,20);
INSERT INTO orderdetails(orderid,productid,quantity) VALUES (2,2,11);
INSERT INTO orderdetails(orderid,productid,quantity) VALUES (3,3,16);
INSERT INTO orderdetails(orderid,productid,quantity) VALUES (4,4,10);
INSERT INTO orderdetails(orderid,productid,quantity) VALUES (5,5,15);
INSERT INTO orderdetails(orderid,productid,quantity) VALUES (6,6,35);
INSERT INTO orderdetails(orderid,productid,quantity) VALUES (7,7,30);
INSERT INTO orderdetails(orderid,productid,quantity) VALUES (8,8,22);
INSERT INTO orderdetails(orderid,productid,quantity) VALUES (9,9,19);




INSERT INTO deliveries(deliveryid,status,orderid,shipperid) VALUES(1,"delivered",3,1);
INSERT INTO deliveries(deliveryid,status,orderid,shipperid) VALUES(2,"delivered",4,2);
INSERT INTO deliveries(deliveryid,status,orderid,shipperid) VALUES(3,"delivered",5,3);
INSERT INTO deliveries(deliveryid,status,orderid,shipperid) VALUES(4,"delivered",6,4);
INSERT INTO deliveries(deliveryid,status,orderid,shipperid) VALUES(5,"delivered",7,5);
INSERT INTO deliveries(deliveryid,status,orderid,shipperid) VALUES(6,"delivered",8,6);
INSERT INTO deliveries(deliveryid,status,orderid,shipperid) VALUES(7,"delivered",9,7);
INSERT INTO deliveries(deliveryid,status,orderid,shipperid) VALUES(8,"delivered",10,8);
INSERT INTO deliveries(deliveryid,status,orderid,shipperid) VALUES(9,"delivered",11,9);




INSERT INTO ledger(transactiondate,accountid, amount , paymentmode,operation) VALUES("2022-05-13 10:25:50", 1,12000, "NET BANKING","C");
INSERT INTO ledger(transactiondate,accountid, amount , paymentmode,operation) VALUES("2022-05-14 12:25:50", 2,10000, "UPI","C");
INSERT INTO ledger(transactiondate,accountid, amount , paymentmode,operation) VALUES("2022-05-14 12:25:00", 3,8000, "UPI","C");
INSERT INTO ledger(transactiondate,accountid, amount , paymentmode,operation) VALUES("2022-05-13 12:25:50", 4,7000, "UPI","C");
INSERT INTO ledger(transactiondate,accountid, amount , paymentmode,operation) VALUES("2022-05-13 12:10:50", 5,12000, "Debit Card","C");
INSERT INTO ledger(transactiondate,accountid, amount , paymentmode,operation) VALUES("2022-05-14 18:35:50", 6,10000, "UPI","C");
INSERT INTO ledger(transactiondate,accountid, amount , paymentmode,operation) VALUES("2022-05-14 23:25:00", 7,8000, "Net Banking","C");
INSERT INTO ledger(transactiondate,accountid, amount , paymentmode,operation) VALUES("2022-05-13 22:00:00", 8,7000, "Debit Card","C");
INSERT INTO ledger(transactiondate,accountid, amount , paymentmode,operation) VALUES("2022-05-13 15:54:50", 9,22000, "UPI","C");


INSERT INTO payments(paymentdate,orderid,amount,paymentmode,transactionid) VALUES ("2022-05-13 10:25:50",1,12000,"NET BANKING",1);
INSERT INTO payments(paymentdate,orderid,amount,paymentmode,transactionid) VALUES ("2022-05-13 10:25:50",2,12000,"UPI",2);
INSERT INTO payments(paymentdate,orderid,amount,paymentmode,transactionid) VALUES ("2022-05-13 10:25:50",3,12000,"UPI",3);
INSERT INTO payments(paymentdate,orderid,amount,paymentmode,transactionid) VALUES ("2022-05-13 10:25:50",4,12000,"UPI",4);
INSERT INTO payments(paymentdate,orderid,amount,paymentmode,transactionid) VALUES ("2022-05-13 10:25:50",5,12000,"Debit Card",5);
INSERT INTO payments(paymentdate,orderid,amount,paymentmode,transactionid) VALUES ("2022-05-13 10:25:50",6,12000,"UPI",6);
INSERT INTO payments(paymentdate,orderid,amount,paymentmode,transactionid) VALUES ("2022-05-13 10:25:50",7,12000,"Net Banking",7);
INSERT INTO payments(paymentdate,orderid,amount,paymentmode,transactionid) VALUES ("2022-05-13 10:25:50",8,12000,"Debit Card",8);
INSERT INTO payments(paymentdate,orderid,amount,paymentmode,transactionid) VALUES ("2022-05-13 10:25:50",9,12000,"UPI",9);


------shipper storeProcedure--------------
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteShipper`(IN shipperid int)
BEGIN
start transaction;
select @shipperid:=shipperid;
DELETE deliveries, shippers
FROM deliveries
inner JOIN shippers
ON shippers.shipperid = deliveries.shipperid
WHERE deliveries.shipperid = @shipperid;
commit;
END