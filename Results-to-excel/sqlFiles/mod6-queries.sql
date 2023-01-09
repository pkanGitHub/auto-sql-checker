-- Calculate the number of orders for each product that has been ordered. Display the product name and number of orders
-- in a column called “Number of Orders”. Display the results in descending order based on “Number of Orders”. Note: You 
--are calculating the number of orders and not quantity ordered. For example, if Alice orders 3 pizzas today and 5 pizzas 
--next week then pizza orders equals 2 and the quantity of pizzas ordered equals 8. 109 rows returned.
SELECT a.productName, COUNT(b.orderNumber) AS "NumberOfOrders"
FROM products AS a
LEFT JOIN orderdetails AS b
ON a.productCode = b.productCode
WHERE b.quantityOrdered > 0
GROUP BY a.productCode
ORDER BY NumberOfOrders DESC;


-- Calculate the total number of each product that has been ordered. Display the product name and quantity ordered in a column called 
-- “Quantity Ordered”. Display the results in descending order based on Quantity Ordered. 109 rows returned.
SELECT a.productName, SUM(b.quantityOrdered) AS "QuantityOrdered"
FROM products AS a
LEFT JOIN orderdetails AS b 
ON a.productCode = b.productCode
WHERE QuantityOrdered > 0
GROUP BY a.productCode
ORDER BY QuantityOrdered DESC;


-- Calculate the total dollar value of the top 25 products that has been ordered in the database. Display the product name and the dollar 
-- value in a column called “Total Value”.
SELECT a.productName, SUM(b.quantityOrdered * b.priceEach) AS "TotalValue"
FROM products AS a 
LEFT JOIN orderdetails AS b
ON a.productCode = b.productCode
GROUP BY a.productCode
ORDER BY TotalValue DESC
LIMIT 25;


-- Calculate the number of orders each customer has placed and display the top 25 in descending order based on orders placed. Display the 
-- customer name and the orders placed in a columns called “Orders Placed”.
SELECT a.customerName, COUNT(b.orderNumber) AS "OrdersPlaced"
FROM customers AS a
LEFT JOIN orders AS b
ON a.customerNumber = b.customerNumber
GROUP BY a.customerNumber
ORDER BY OrdersPlaced DESC
LIMIT 25;

-- Calculate the total payments made each year. Display the year and total payments in a column called “Total Payments”. Note: you will 
-- have to use the YEAR() function to get the year portion of the payment date.
SELECT YEAR(a.paymentDate) AS "year", SUM(a.amount) AS "TotalPayments"
FROM payments AS a
GROUP BY year; 


-- Calculate the total payments made each month in 2004. Display the month and total payments in a column called “Total Payments”. Order 
-- the results by month in ascending order. Note: you will have to use the MONTH() and YEAR() functions.
SELECT MONTH(a.paymentDate) AS "month", SUM(a.amount) AS "TotalPayments"
FROM payments AS a
WHERE YEAR(a.paymentDate) = "2004"
GROUP BY month
ORDER BY month;

-- Calculate the total payments made each day in December of 2004. Display the day in a column named “Day” and total payments in a column 
-- called “Total Payments”. Order the results by day in ascending order. Note: you will have to use the MONTH(), DAY(), and YEAR() functions.
SELECT DAY(a.paymentDate) AS "Day", SUM(a.amount) AS "TotalPayments"
FROM payments AS a
WHERE YEAR(a.paymentDate) = "2004" AND MONTH(a.paymentDate) = "12"
GROUP BY Day
ORDER BY Day;


-- Calculate the total payments made by each customer in the database who has made a payment. Display the customer name and the total 
-- payments in a column named “Total Payments”. Order the results by total payments.
SELECT a.customerName, SUM(b.amount) AS "TotalPayments"
FROM customers AS a
LEFT JOIN payments AS b
ON a.customerNumber = b.customerNumber
-- WHERE TotalPayments > 0
GROUP BY a.customerNumber
ORDER BY TotalPayments DESC;


-- Calculate and display the number of customers in each state. Display the state name and and number of customers in each state in a 
-- column called “Number of Customers in State”. Sort the results by the Number of Customers in State.
SELECT a.state, COUNT(a.customerNumber) AS "NumberOfCustomerInState"
FROM customers AS a
GROUP BY a.state
ORDER BY NumberOfCustomerInState DESC;


-- Which employees manage the most people? Develop a query to calculate the number of people each employees manages. Display the employee 
-- number and number of employees employees they manage in a column called “Number of Reports”. Hint: we know an employee manages another employee if their employee number appears in the reportsTo column in the employee table.
SELECT manager.employeeNumber, COUNT(sub.employeeNumber) AS "NumberOfReports" 
FROM employees AS sub
JOIN employees AS manager
ON sub.reportsTo = manager.employeeNumber
GROUP BY sub.reportsTo
ORDER BY NumberOfReports DESC;
-- LIMIT 1; -- BUT SINCE THERE'S 2 WITH EQUAL NUMBERS OF PEOPLE THEY MANAGED, I JUST LEFT IT OUT.

SELECT a.reportsTo AS employeeNumber, COUNT(a.reportsTo) AS "Reports"
FROM employees AS a
GROUP BY a.reportsTo
ORDER BY Reports DESC;


-- Write a query to calculate the number of product lines in the database. Display the result in a column called “Number of Lines”.
SELECT COUNT(a.productLine) AS "NumberOfLines"
FROM products AS a;


-- Calculate the dollar value of each product in inventory. You can calculate this by multiplying the quantity in stock by the buy 
-- price. Display the product name, quantity in stock, buy price, and in its dollar value in a column called “Dollar Value”. Sort the 
-- results in descending order based on dollar value.
SELECT a.productName, a.quantityInStock, a.buyPrice, SUM(a.quantityInStock * a.buyPrice) AS "DollarValue"
FROM products AS a
GROUP BY a.productCode
ORDER BY DollarValue DESC;

