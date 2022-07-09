/*
** Copyright Microsoft, Inc. 1994 - 2000
** Dev for Rafael Felipe Gonzalez
** rfgonzalezs@gmail.com

Ejercicio 6: 
Muestra los productos que generaron un monto total de venta mayor o igual a $30,000 y muestra las unidades vendidas de cada producto en 2018
*/
USE Northwind
GO
SELECT p.ProductName, SUM(od.Quantity) AS [Number of Units], SUM(od.Quantity * od.UnitPrice) as [TotalAmount]
FROM[Orders] o
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
INNER JOIN [Products] p ON od.ProductID = p.ProductID
WHERE YEAR(o.OrderDate) = '2018'
GROUP BY p.ProductName
HAVING SUM (od.Quantity * od.UnitPrice) >= 30000