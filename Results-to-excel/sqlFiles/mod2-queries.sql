-- I only use shorthand for the one I need to repeat more than 1 time in one query
-- Display all of the customer data. (25 rows returned)
SELECT * FROM customer;
-- Display all of the agent data. (12 rows returned)
SELECT * FROM agents;
-- Display customer names and grades. (25 rows returned)
SELECT c.CUST_NAME, c.GRADE FROM customer AS c;
-- Display agent code, name, and working area. (12 rows returned)
SELECT a.AGENT_CODE, a.AGENT_NAME, a.WORKING_AREA FROM agents AS a;
-- Display order number, order amount, and order date. (34 rows returned)
SELECT o.ORD_NUM, o.ORD_AMOUNT, o.ORD_DATE FROM orders AS o;
-- Show all customer code, name, country, and phone number, for all customers from the United States. (4 rows returned)
SELECT c.CUST_CODE, c.CUST_NAME, c.CUST_COUNTRY, c.PHONE_NO 
FROM customer AS c 
WHERE c.CUST_COUNTRY = "USA";

-- Show agent names and phone numbers for agents from Bangalore. (3 rows returned)
SELECT a.AGENT_NAME, a.PHONE_NO 
FROM agents AS a 
WHERE a.WORKING_AREA = "Bangalore";

-- Show orders with advance amounts of $100. (6 rows returned)
SELECT * FROM orders WHERE orders.ADVANCE_AMOUNT = 100;
-- Show the names of grade 2 customers. (10 rows returned)
SELECT c.CUST_NAME FROM customer AS c WHERE c.GRADE = 2;
-- Show all customer information for customers from New York. (3 rows returned)
SELECT * FROM customer WHERE customer.CUST_CITY = "New York";
-- Show all agent information for agents who work in London with commission rates greater than 0.12. (2 rows returned)
SELECT * FROM agents AS a WHERE a.WORKING_AREA = "London" AND a.COMMISSION > 0.12;
-- Show order number, agent code, and customer code for orders with advance amount less than or equal to $500, and order amount greater than or equal to $1500. (9 rows returned)
SELECT o.ORD_NUM, o.AGENT_CODE, o.CUST_CODE 
FROM orders AS o 
WHERE o.ADVANCE_AMOUNT <= 500 AND o.ORD_AMOUNT >= 1500;

-- Show customer code, customer name, agent code, and outstanding amount for customers with outstanding amounts greater than $6000 and pay amount less tha or equal to $3000. (3 rows returned)
SELECT c.CUST_CODE, c.CUST_NAME, c.AGENT_CODE, c.OUTSTANDING_AMT 
FROM customer AS c 
WHERE c.OUTSTANDING_AMT > 6000 AND c.PAYMENT_AMT <= 3000;

-- Show order numbers for order amounts less than $1000. (8 rows returned)
SELECT o.ORD_NUM 
FROM orders AS o 
WHERE o.ORD_AMOUNT < 1000;

-- Show customer names from India with outstanding amounts less than $10,000. (5 rows returned)
SELECT c.CUST_NAME 
FROM customer AS c 
WHERE c.CUST_COUNTRY = "India" AND c.OUTSTANDING_AMT < 10000;