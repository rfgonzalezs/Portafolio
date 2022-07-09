/*
** Copyright Microsoft, Inc. 1994 - 2000
** Dev for Rafael Felipe Gonzalez
** rfgonzalezs@gmail.com

Ejercicio 10: 
Numero de ordenes por clientes
*/
USE Northwind
GO
SELECT c.CompanyName,
(SELECT COUNT(OrderID) FROM [Orders] o
WHERE c.CustomerID = o.CustomerID) AS [Number of Orders]
FROM [Customers] c
ORDER BY [Number of Orders] DESC