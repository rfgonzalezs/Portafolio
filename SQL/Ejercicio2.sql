/*
** Copyright Microsoft, Inc. 1994 - 2000
** Dev for Rafael Felipe Gonzalez
** rfgonzalezs@gmail.com

Ejercicio 2: Encontrar el segundo producto con el precio mas alto en la compañia
*/

USE Northwind
GO 
--SELECT ProductID, ProductName, UnitPrice
--FROM [Products]
--ORDER BY UnitPrice DESC
SELECT ProductName, UnitPrice
FROM [Products] p1
WHERE  1 = (SELECT COUNT(DISTINCT UnitPrice)
FROM Products p2
WHERE p2.UnitPrice > p1.UnitPrice)