/*
** Copyright Microsoft, Inc. 1994 - 2000
** Dev for Rafael Felipe Gonzalez
** rfgonzalezs@gmail.com

Ejercicio 7: 
¿Que clientes generaron ventas por arriba promedio del total de ventas?
Filtrar por año
*/
USE Northwind
GO
SELECT c.CompanyName, c.City, c.Country,
SUM(od.Quantity * od.UnitPrice) as Total
FROM [Customers] c
INNER JOIN [Orders] o ON c.CustomerID = o.CustomerID
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
WHERE YEAR(o.OrderDate) = '2018'
GROUP BY c.CompanyName,c.City, c.Country
HAVING SUM(od.Quantity * od.UnitPrice) > (SELECT AVG(Quantity * UnitPrice) FROM [Order Details])
ORDER BY Total DESC