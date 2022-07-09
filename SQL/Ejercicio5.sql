/*
** Copyright Microsoft, Inc. 1994 - 2000
** Dev for Rafael Felipe Gonzalez
** rfgonzalezs@gmail.com

Ejercicio 5: Encontrar las ordenes que tardaron mas de 2 dias enentregarse despues de ser realizadas por el usuario, donde el valor sea mayor a 10,000
mostrar numero de dias, fecha de la orden, customer ID y pais de envio
*/
USE Northwind
GO
SELECT TOP 10 c.CompanyName, c.Country, c.City,
SUM(od.Quantity * od.UnitPrice) as [Total Sale]
FROM [Customers] c
INNER JOIN [Orders] o ON c.CustomerID = o.CustomerID
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
WHERE YEAR(o.OrderDate) = '2018'
GROUP BY c.CompanyName, c.Country, c.City
ORDER BY [Total Sale] DESC