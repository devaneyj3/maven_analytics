SELECT 
	* 
FROM order_details

SELECT 
	*
FROM menu_items

/*
View the order_details table. What is the date range of the table?
*/
SELECT 
	MAX(order_date) as most_recent_date, 
    MIN(order_date) AS earliest_date 
FROM 
	order_details

/*
How many orders were made within this date range? How many items were ordered within this date range?
*/

SELECT 
	COUNT(DISTINCT order_id) AS number_of_orders 
FROM 
	order_details

SELECT 
	COUNT(*) AS num_items 
FROM 
	order_details

/*
Which orders had the most number of items?
*/

SELECT 
	DISTINCT order_id, 
    COUNT(item_id) AS num_items 
FROM 
	order_details 
GROUP BY 
	order_id 
ORDER BY 
	COUNT(item_id) DESC

/*
How many orders had more than 12 items?
*/

SELECT 
	COUNT(*) AS orders_over_12
FROM
	(SELECT 
		order_id, 
		COUNT(item_id) AS num_items 
	FROM 
		order_details 
	GROUP BY 
		order_id 
	HAVING
		COUNT(item_id) > 12
	ORDER BY 
		COUNT(item_id) DESC) AS num_orders
