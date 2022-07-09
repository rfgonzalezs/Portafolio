/*
** Copyright Microsoft, Inc. 1994 - 2000
** Dev for Rafael Felipe Gonzalez
** rfgonzalezs@gmail.com

Ejercicio 9: 
¿Que clientes no han comprado en los ultimos 20 meses?
*/
USE Northwind
GO
SELECT c.CompanyName, MAX(o.OrderDate),
DATEDIFF(MONTH,MAX(o.OrderDate), GETDATE()) AS [Months Since Last Order]
FROM [Customers] c
INNER JOIN[Orders] o ON c.CustomerID = o.CustomerID
GROUP BY c.CompanyName
HAVING DATEDIFF(MONTH,MAX(o.OrderDate), GETDATE()) > 20
