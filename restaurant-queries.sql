--WHO GOT CHEESEBURGERS
SELECT CustomerName
from CUSTOMER
where OrderID IN
(SELECT OrderID
from ORDERS
where Item1 = 'Cheeseburger' OR Item2 = 'Cheeseburger');

--WHO LIVES TOGETHER
SELECT CustomerName
from CUSTOMER
where OrderID IN
(SELECT OrderID
from DELIVERY
where Address = '8 North St');

--WHO GETS FOOD IN UNDER 15 MIN (Prep + Delivery)
SELECT c.CustomerName, f.PrepTime, d.ETAMIN
from((CUSTOMER c JOIN ORDERS o ON c.OrderID = o.OrderID) JOIN TICKET t ON o.OrderID = t.OrderID JOIN CHEF f ON t.ChefID = f.ChefID JOIN DELIVERY d ON o.OrderID = d.OrderID)
where PrepTime + ETAMIN < 15;

--EXPENSIVE FOOD
SELECT c.CustomerName, o.Item1, o.Item2, o.Price
from(CUSTOMER c JOIN ORDERS o ON c.OrderID = o.OrderID)
where Price > 20;

--SAME NAME
SELECT c.CustomerName, f.ChefName
from((CUSTOMER c JOIN ORDERS o ON c.OrderID = o.OrderID) JOIN TICKET t ON o.OrderID = t.OrderID JOIN CHEF f ON t.ChefID = f.ChefID)
where c.CustomerName LIKE f.ChefName;

--NOTHING
SELECT CustomerName
from CUSTOMER
where OrderID IN
(SELECT OrderID
from ORDERS
where Price = 0);