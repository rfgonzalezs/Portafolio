/*
** Copyright Microsoft, Inc. 1994 - 2000
** Dev for Rafael Felipe Gonzalez
** rfgonzalezs@gmail.com

Ejercicio 12: 
Muestra los empleados con mas ventas
Calcula unos bonos por sus ventas del 2%
*/
USE Northwind
GO
SELECT TOP 3 e.FirstName + ' ' + e.LastName AS [Full Name],
SUM(od.Quantity *od.UnitPrice) as [Total Sale],
ROUND(SUM(od.Quantity *od.UnitPrice)*0.02,0) as Bonus
FROM[Employees] e
INNER JOIN [Orders] o ON e.EmployeeID = o.EmployeeID
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
WHERE YEAR(o.OrderDate) = '2018'
AND MONTH(o.OrderDate) = '01'
GROUP BY e.FirstName + ' ' + e.LastName
