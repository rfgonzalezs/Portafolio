/*
** Copyright Microsoft, Inc. 1994 - 2000
** Dev for Rafael Felipe Gonzalez
** rfgonzalezs@gmail.com

Ejercicio 4: Encontrar las ordenes que tardaron mas de 2 dias enentregarse despues de ser realizadas por el usuario, donde el valor sea mayor a 10,000
mostrar numero de dias, fecha de la orden, customer ID y pais de envio
*/
USE Northwind
GO
SELECT o.OrderID, o.CustomerID, o.OrderDate, o.ShippedDate, o.ShipCountry,
DATEDIFF(DAY, OrderDate,ShippedDate) AS Duration_to_Ship,
SUM(od.Quantity * od.UnitPrice) as [Total Sell Amount]
FROM[Orders] o
INNER JOIN [Order Details] od on o.OrderID = od.OrderID
WHERE DATEDIFF(DAY, OrderDate,ShippedDate) > 2 
GROUP BY o.OrderID, o.CustomerID, o.OrderDate, o.ShippedDate, o.ShipCountry
HAVING SUM(od.Quantity * od.UnitPrice) > 10000