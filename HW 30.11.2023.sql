/*
1. Вывести название и стоимость в USD 
одного самого дорогого проданного товара

*/

SELECT ProductName, Price
FROM products
WHERE ProductID = (
    SELECT ProductID
    FROM order_details
    ORDER BY Price DESC
    LIMIT 1
);


/*
2.Вывести два самых дорогих 
  товара из категории Beverages из USA
*/

SELECT p.ProductName, p.Price
FROM Products p
JOIN order_details o ON p.ProductID = o.ProductID
JOIN Suppliers s ON p.SupplierID = s.SupplierID
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE c.CategoryName = 'Beverages' AND s.Country = 'USA'
ORDER BY p.Price DESC
LIMIT 2;


-- 3. Вывести список стран, которые поставляют морепродукты

SELECT DISTINCT s.Country
FROM Suppliers s
JOIN Products p ON s.SupplierID = p.SupplierID
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE c.CategoryName = 'Seafood';








