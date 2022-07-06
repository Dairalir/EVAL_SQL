-- 1- Liste des clients français :
SELECT CompanyName AS Société, ContactName AS contact, ContactTitle AS Fonction, Phone AS Téléphone
FROM customers
WHERE Country = 'France'

-- 2- Liste des produits vendus par le fournisseur "Exotic Liquids" :
SELECT ProductName AS Produit, UnitPrice AS Prix
FROM products
INNER JOIN suppliers ON products.SupplierID = suppliers.SupplierID
WHERE CompanyName = 'Exotic Liquids'

-- 3- Nombre de produits mis à disposition par les fournisseurs français (tri par nombre de produits décroissant) :
SELECT CompanyName AS Fournisseur, COUNT(ProductName) AS Nbre_produits
FROM products
INNER JOIN suppliers ON products.SupplierID = suppliers.SupplierID
WHERE suppliers.Country = 'France'
GROUP BY CompanyName
ORDER BY Nbre_produits DESC

-- 4- Liste des clients français ayant passé plus de 10 commandes :
SELECT CompanyName AS 'client', COUNT(orders.OrderID) AS Nbre_Commande
FROM customers
INNER JOIN orders ON customers.CustomerID = orders.CustomerID
WHERE customers.Country = 'France' 
GROUP BY CompanyName
HAVING Count(orders.orderID)>10

-- 5- Liste des clients dont le montant cumulé de toutes les commandes passées est supérieur à 30000 € :
SELECT CompanyName AS 'Client', SUM(UnitPrice*Quantity), Country
FROM customers
INNER JOIN orders ON customers.CustomerID = orders.CustomerID
INNER JOIN `order details` ON orders.OrderID = `order details`.OrderID
GROUP BY CompanyName
HAVING SUM(UnitPrice*Quantity) > 30000
ORDER BY SUM(UnitPrice*Quantity) DESC

-- 6- Liste des pays dans lesquels des produits fournis par "Exotic Liquids" ont été livrés :
SELECT ShipCountry
FROM suppliers
INNER JOIN products ON suppliers.SupplierID = products.SupplierID
INNER JOIN `order details` ON products.ProductID = `order details`.ProductID
INNER JOIN orders ON `order details`.OrderID = orders.OrderID
WHERE CompanyName = 'Exotic Liquids'
AND ShippedDate LIKE '%'
GROUP BY ShipCountry

-- 7- Chiffre d'affaires global sur les ventes de 1997 :
SELECT SUM(Unitprice*Quantity) AS 'Montant Vente 97'
FROM `order details`
INNER JOIN orders ON `order details`.OrderID = orders.OrderID
WHERE OrderDate LIKE '1997-%-%'

-- 8- Chiffre d'affaires détaillé par mois, sur les ventes de 1997 :
SELECT DISTINCT MONTH(OrderDate) AS 'Mois 97',SUM(Unitprice*Quantity) AS 'Montant Ventes '
FROM `order details`
INNER JOIN orders ON `order details`.OrderID = orders.OrderID
WHERE OrderDate LIKE '1997-%-%'
GROUP BY MONTH(OrderDate)

-- 9- A quand remonte la dernière commande du client nommé "Du monde entier" ?
SELECT MAX(OrderDate) AS 'Date de derniere commande'
FROM orders
INNER JOIN customers ON orders.CustomerID = customers.CustomerID
WHERE CompanyName = 'Du monde entier'

--10- Quel est le délai moyen de livraison en jours ?
SELECT ROUND(AVG(DATEDIFF(ShippedDate, OrderDate))) AS 'Délai moyen de livraison en jours'
FROM orders
