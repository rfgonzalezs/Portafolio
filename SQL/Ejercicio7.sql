/*
** Copyright Microsoft, Inc. 1994 - 2000
** Dev for Rafael Felipe Gonzalez
** rfgonzalezs@gmail.com

Ejercicio 6: 
Califica los clientes de acuerdo al total de ventas:
Nivel A: >= 30000 
Nivel B: >= 20000 y < 30000
Nivel C: < 20000
*/
USE Northwind
GO
SELECT c.CompanyName,
SUM(od.Quantity * od.UnitPrice) as Total,
CASE
	WHEN SUM(od.Quantity * od.UnitPrice) >= 30000 THEN 'A'
	WHEN SUM(od.Quantity * od.UnitPrice) < 30000 AND SUM(od.Quantity * od.UnitPrice) >= 20000 THEN 'B'
	ELSE 'C'
	END AS LEVEL
FROM [Customers] c
INNER JOIN [Orders] o ON c.CustomerID = o.CustomerID
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.CompanyName