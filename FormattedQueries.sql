SELECT a.productName, COUNT(b.orderNumber) AS "NumberOfOrders" FROM products AS a LEFT JOIN orderdetails AS b ON a.productCode = b.productCode WHERE b.quantityOrdered > 0 GROUP BY a.productCode ORDER BY NumberOfOrders DESC
SELECT a.productName, SUM(b.quantityOrdered) AS "QuantityOrdered" FROM products AS a LEFT JOIN orderdetails AS b ON a.productCode = b.productCode WHERE QuantityOrdered > 0 GROUP BY a.productCode ORDER BY QuantityOrdered DESC
SELECT a.productName, SUM(b.quantityOrdered * b.priceEach) AS "TotalValue" FROM products AS a LEFT JOIN orderdetails AS b ON a.productCode = b.productCode GROUP BY a.productCode ORDER BY TotalValue DESC LIMIT 25
SELECT a.customerName, COUNT(b.orderNumber) AS "OrdersPlaced" FROM customers AS a LEFT JOIN orders AS b ON a.customerNumber = b.customerNumber GROUP BY a.customerNumber ORDER BY OrdersPlaced DESC LIMIT 25
SELECT YEAR(a.paymentDate) AS "year", SUM(a.amount) AS "TotalPayments" FROM payments AS a GROUP BY year
SELECT MONTH(a.paymentDate) AS "month", SUM(a.amount) AS "TotalPayments" FROM payments AS a WHERE YEAR(a.paymentDate) = "2004" GROUP BY month ORDER BY month
SELECT DAY(a.paymentDate) AS "Day", SUM(a.amount) AS "TotalPayments" FROM payments AS a WHERE YEAR(a.paymentDate) = "2004" AND MONTH(a.paymentDate) = "12" GROUP BY Day ORDER BY Day
SELECT a.customerName, SUM(b.amount) AS "TotalPayments" FROM customers AS a LEFT JOIN payments AS b ON a.customerNumber = b.customerNumber WHERE TotalPayments > 0 GROUP BY a.customerNumber ORDER BY TotalPayments
SELECT a.state, COUNT(a.customerNumber) AS "NumberOfCustomerInState" FROM customers AS a GROUP BY a.state ORDER BY NumberOfCustomerInState DESC
SELECT manager.employeeNumber, COUNT(sub.employeeNumber) AS "NumberOfReports" FROM employees AS sub JOIN employees AS manager ON sub.reportsTo = manager.employeeNumber GROUP BY sub.reportsTo ORDER BY NumberOfReports DESC
SELECT a.reportsTo AS employeeNumber, COUNT(a.reportsTo) AS "Reports" FROM employees AS a GROUP BY a.reportsTo ORDER BY Reports DESC
SELECT COUNT(a.productLine) AS "NumberOfLines" FROM products AS a
SELECT a.productName, a.quantityInStock, a.buyPrice, SUM(a.quantityInStock * a.buyPrice) AS "DollarValue" FROM products AS a GROUP BY a.productCode ORDER BY DollarValue DESC

