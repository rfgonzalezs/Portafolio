/*
** Copyright Microsoft, Inc. 1994 - 2000
** Dev for Rafael Felipe Gonzalez
** rfgonzalezs@gmail.com

Ejercicio 13: 
¿Cuantos empleados tienes por posicion y ciudad?
*/
USE Northwind
GO
SELECT title, City, count(EmployeeID) as [Number Employees] 
FROM[Employees]
GROUP BY Title, City