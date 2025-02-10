-- Create the table (run only once) creating dataofcustomer table
CREATE TABLE IF NOT EXISTS dataofcustomer (
    custid VARCHAR(6) PRIMARY KEY,
    fname VARCHAR(50),
    mname VARCHAR(30),
    ltname VARCHAR(30),
    city VARCHAR(15),
    age INT,
    mobileno VARCHAR(10),
    occupation VARCHAR(10),
    dob DATE
);
SHOW TABLES;
SELECT custid FROM dataofcustomer;


-- Insert data into the dataofcustomer table
INSERT INTO dataofcustomer VALUES('c33339','paresh','nilesh','meh','mumbai',26,'3930293849','sales','1980-09-02');
INSERT INTO dataofcustomer VALUES('c78678','arjav',NULL,'shah','kalkota',40,'3250293849','electricer','1989-01-06');
INSERT INTO dataofcustomer VALUES('c06645','tomy',NULL,'mehta','mumbai',34,'7850293839','worker','2001-08-04');
INSERT INTO dataofcustomer VALUES('c43189','nelash','george','albert','delhi',21,'3950293349','student','2004-04-09');
INSERT INTO dataofcustomer VALUES('c83367','marul',NULL,'sandi','delhi',30,'1950293849','postman','1971-10-05');
INSERT INTO dataofcustomer VALUES('c07757','parul',NULL,'handi','delhi',36,'2950293849','ictman','1999-01-12');
INSERT INTO dataofcustomer VALUES('c32886','darul',NULL,'handi','delhi',36,'2970293849','wife','1976-11-03');

-- calling custid column from dataofcustomer table.
SELECT custid FROM dataofcustomer;

-- Showing all the tables
SHOW TABLES;

-- Query to view the data in the table
SELECT * FROM dataofcustomer;

-- finding the minimum age of customers with first names and grouping by first names in the dataofcustomer table.
SELECT MIN(age) AS minage, fname
FROM dataofcustomer
GROUP BY fname;

-- Finds the maximum age of customers and groups the results by their first and last names
select max(age) as maxage, fname, ltname from dataofcustomer group by fname, ltname;
select fname, ltname, max(age) as maxage from dataofcustomer group by fname, ltname;

-- it gives total customer
select count(age) as total_customer from dataofcustomer;

-- Finds out customers with less then 30 years old in the dataofcustomer table
select count(*) as total_customer_under_30
from dataofcustomer
where age < 30;

-- Finding out total customers in each city
select city, count(*) as total_customer
from dataofcustomer
group by city;

-- it gives the total number of customer from Delhi
select count(city) as customer_from_delhi
from dataofcustomer
where city = 'delhi';

-- -- This SQL query counts the number of unique last names in the 'dataofcustomer' table, eliminates duplicates and null ones in the count.
SELECT COUNT(DISTINCT ltname) AS unique_last_names
FROM dataofcustomer;
select count(distinct fname) as unique_first_names
from dataofcustomer;

-- it finds out total customers in the each cities, grouping by city, with a condition of more then 5 for each city.
SELECT city, COUNT(*) AS total_customers
FROM dataofcustomer
GROUP BY city
HAVING COUNT(*) > 5;

-- it finds out number of total customers with a condition of age older then 30.
SELECT city, COUNT(*) AS total_customers
FROM dataofcustomer
WHERE age > 30
GROUP BY city;
-- it finds out number of total customers with a condition of age older then 30 and customer amount more then 5 per city with descending order by total customers.
SELECT city, COUNT(*) AS total_customers
FROM dataofcustomer
WHERE age > 30
GROUP BY city
HAVING COUNT(*) > 5
ORDER BY total_customers DESC;

-- in city Mumbai number of customers age older then 30.
select city = 'mumbai', COUNT(*) as total_customer
from dataofcustomer
where age > 30 
group by city = 'mumbai';

-- in dataofcustomer table customers 25 years old. 
select min(age) from dataofcustomer where age = 25

-- 36 years olds with first names
select fname, age from dataofcustomer where age = 36;

-- Customers in Mumbai and Delhi, limiting to first 5 rows.
SELECT city, COUNT(*)
FROM dataofcustomer
WHERE city in ( 'mumbai','delhi')
group by city
limit 5;

-- Describing the account table
describe account;
show create table account;

-- Inserting some values into account table.
INSERT INTO account VALUES ('A00001', 'C00001', 'B00001', 1000, '2012-12-15', 'Saving', 'Active');
INSERT INTO account VALUES ('A00002', 'C00002', 'B00002', 1000, '2013-08-12', 'Saving', 'Active');
INSERT INTO account VALUES ('A00003', 'C00003', 'B00003', 1500, '2014-05-20', 'Checking', 'Active');
INSERT INTO account VALUES ('A00004', 'C00004', 'B00004', 2000, '2015-01-10', 'Saving', 'Active');
INSERT INTO account VALUES ('A00005', 'C00005', 'B00005', 2500, '2016-09-25', 'Checking', 'Active');
INSERT INTO account VALUES ('A00006', 'C00006', 'B00006', 3000, '2017-07-30', 'Saving', 'Inactive');
INSERT INTO account VALUES ('A00007', 'C00007', 'B00007', 3500, '2018-03-15', 'Checking', 'Active');
INSERT INTO account VALUES ('A00008', 'C00008', 'B00008', 4000, '2019-11-05', 'Saving', 'Active');
INSERT INTO account VALUES ('A00009', 'C00009', 'B00009', 4500, '2020-06-18', 'Checking', 'Inactive');
INSERT INTO account VALUES ('A00010', 'C00010', 'B00010', 5000, '2021-02-12', 'Saving', 'Active');

-- Describing account table.
describe account;

-- Counting the rows in account table.
select count(*) from account;

# Counts the astatus in account table and grouping by astatus
select count(*), astatus from account group by astatus;

-- Count of the customers with condition more then 2 in each city.
select count(*), city from dataofcustomer group by city having count(*)>2;
select count(*), city from dataofcustomer group by city having count(*)!=4;

-- in the account table account status amount with condition of account types more then 2.
select count(*),astatus from account group by astatus having count(atype)>2;

-- in the account table grouping account status and finding the total account status.
select count(*) ,astatus from account group by astatus;

-- finding out amount of 'Saving' account type in the descending order.
select  * from account where atype = 'Saving' order by aod DESC;

-- in the account table amount of 'Active' account in descending order.
select  * from account where astatus = 'Active' order by atype desc;
