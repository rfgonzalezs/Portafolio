/*
** Copyright Microsoft, Inc. 1994 - 2000
** Dev for Rafael Felipe Gonzalez
** rfgonzalezs@gmail.com

Ejercicio 15: 
¿Cuanto empleados son mayores de 70 años?
*/
USE Northwind
GO
SELECT FirstName, LastName, Title,
DATEDIFF(YEAR, BirthDate, GETDATE()) as Age
FROM [Employees]
WHERE DATEDIFF(YEAR, BirthDate, GETDATE()) >= 70