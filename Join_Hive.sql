/*
https://cwiki.apache.org/confluence/display/Hive/LanguageManual+Joins

NOTE:- 1.  There is no concept of primary key and foreign key in Hive.
       2. We can't put NOT NULL constraint on hive columns.
       3.


*/

---Customers Table Creation

CREATE TEMPORARY TABLE Customers(
      customerid INT,
      fname VARCHAR(20),
      emailid VARCHAR(100)
      )
  ---Orders Table Creation
  
  CREATE TEMPORARY TABLE Orders(
      orderid INT,
      customerid INT,
      ordereditem VARCHAR(100)
      )
      
    INSERT INTO TABLE Customers VALUES(101,'Jhon','Jhon123@gmail.com');
    INSERT INTO TABLE Customers VALUES(102,'Rob','Rob123@gmail.com');
    INSERT INTO TABLE Customers VALUES(103,'David','David123@gmail.com');
    
    
    INSERT INTO TABLE Orders VALUES(1001,101,'Laptop');
    INSERT INTO TABLE Orders VALUES(1002,102,'Grocery');
    INSERT INTO TABLE Orders VALUES(1003,NULL,'Fruits');
    
   SELECT * FROM customers;
   
   SELECT * FROM orders;
   #----------------------JOIN--------------------
   
   SELECT c.customerid,c.fname,c.emailid,o.orderid,o.ordereditem FROM 
   customers AS c JOIN orders AS o
   ON c.customerid=o.customerid
   WHERE fname='Jhon';     
      
      
