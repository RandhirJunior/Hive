/*
https://cwiki.apache.org/confluence/display/Hive/LanguageManual+Joins

NOTE:- 1.  There is no concept of primary key and foreign key in Hive.
       2. We can't put NOT NULL constraint on hive columns.
       3. JOIN and INNER JOIN both are same.
       4. LEFT JOIN and LEFT OUTER JOIN are same.
       5. RIGHT JOIN and RIGHT OUTER JOIN are same.
       6. FULL JOIN and FULL OUTER JOIN are same.


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
      
     
  #---------------------LEFT JOIN--OR LEFT OUTER JOIN------------------
   
   SELECT c.customerid,c.fname,c.emailid,o.orderid,o.ordereditem FROM 
   customers AS c LEFT OUTER JOIN orders AS o
   ON c.customerid=o.customerid
   
   
    #---------------------RIGHT JOIN--OR RIGHT OUTER JOIN------------------
   
   SELECT c.customerid,c.fname,c.emailid,o.orderid,o.ordereditem FROM 
   customers AS c RIGHT OUTER JOIN  orders AS o
   ON c.customerid=o.customerid

      #---------------------FULL JOIN--OR FULL OUTER JOIN------------------
   
   SELECT c.customerid,c.fname,c.emailid,o.orderid,o.ordereditem FROM 
   customers AS c FULL OUTER JOIN  orders AS o
   ON c.customerid=o.customerid

#----------------------------MY WORK-------------------

INSERT INTO THIRD_TBL VALUES(11,'BRL') 

CREATE TEMPORARY TABLE TEST_TABLE (id int, name string)

CREATE TEMPORARY TABLE MY_TABLE (id int, name string,values BIGINT)

CREATE TEMPORARY TABLE THIRD_TBL (id int, county_code string)

SELECT * FROM MY_TABLE;
SELECT * FROM TEST_TABLE;

DROP TABLE test_table;

#---------------------------------INEER JOIN-----------------------------------------


WITH CET_MY AS
(
SELECT t1.id,t1.name ,t2.values from 
TEST_TABLE AS t1
 JOIN 
 MY_TABLE AS t2
 ON t2.id=t1.id 
 )  
 
SELECT * from CET_MY
JOIN THIRD_TBL t3
ON CET_MY.id = t3.id
      
