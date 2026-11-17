-- Combine the menu_items and order_details tables into a single table

SELECT * FROM menu_items mi
LEFT JOIN order_details od ON mi.menu_item_id = od.item_id

-- What were the least and most ordered items? What categories were they in?

SELECT 
	mi.item_name,
    mi.category,
    COUNT(od.item_id) AS times_ordered
FROM
	order_details od
LEFT JOIN menu_items mi
	ON mi.menu_item_id = od.item_id
GROUP BY 
	mi.item_name,
    mi.category
ORDER BY
	COUNT(od.item_id) DESC

-- What were the top 5 orders that spent the most money?
SELECT 
	od.order_id,
	SUM(mi.price) AS price
FROM
	order_details od
LEFT JOIN menu_items mi
	ON mi.menu_item_id = od.item_id
GROUP BY 
	od.order_id
ORDER BY
	SUM(mi.price) DESC
LIMIT 5

-- View the details of the highest spend order. Which specific items were purchased?
SELECT 
	*
FROM
	order_details od
LEFT JOIN menu_items mi
	ON mi.menu_item_id = od.item_id
WHERE 
	od.order_id = 440
    
-- BONUS: View the details of the top 5 highest spend orders
SELECT 
	*
FROM
	order_details od
LEFT JOIN menu_items mi
	ON mi.menu_item_id = od.item_id
WHERE 
	od.order_id IN (440, 2075, 1957, 330, 2675)