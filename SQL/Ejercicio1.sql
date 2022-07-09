/*
** Copyright Microsoft, Inc. 1994 - 2000
** Dev for Rafael Felipe Gonzalez
** rfgonzalezs@gmail.com

Ejercicio 1: Encontrar el TOP 10 de productos comprados
*/

USE Northwind
GO 
SELECT TOP 10 p.ProductName, sum(od.Quantity) AS [Units Sold] 
FROM [Order Details] od
INNER JOIN [Products] p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY [Units Sold] DESC


/*SELECT od.ProductID, sum(od.Quantity) AS [Units Sold] 
**FROM [Order Details] od
**GROUP BY od.ProductID
**ORDER BY [Units Sold]
*/
