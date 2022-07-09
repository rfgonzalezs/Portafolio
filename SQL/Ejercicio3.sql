/*
** Copyright Microsoft, Inc. 1994 - 2000
** Dev for Rafael Felipe Gonzalez
** rfgonzalezs@gmail.com

Ejercicio 3: Crear un RANK de productos vendidos ordenado por ciudad y cantidad en USA
*/

USE Northwind
GO
SELECT p.ProductName,c.City, od.Quantity,
DENSE_RANK () OVER (PARTITION BY c.City ORDER BY od.Quantity DESC) AS RANK
FROM [Customers] c
INNER JOIN [Orders] o on (c.CustomerID = o.CustomerID)
INNER JOIN [Order Details] od on (o.OrderID = od.OrderID)
INNER JOIN [Products] p on (od.ProductID = p.ProductID)
WHERE Country = 'USA'
AND c.City ='Boise'
--ORDER BY od.Quantity DESC
ORDER BY RANK ASC

