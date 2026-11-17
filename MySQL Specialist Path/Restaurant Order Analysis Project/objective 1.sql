/*
View the menu_items table and write a query to find the number of items on the menu
*/

SELECT 
	COUNT(menu_item_id)
FROM 
	menu_items;

/*
What are the least and most expensive items on the menu?
*/
	
SELECT 
	item_name,
    price
FROM 
	menu_items
ORDER BY
	price DESC
/*
How many Italian dishes are on the menu? What are the least and most expensive Italian dishes on the menu?
*/

SELECT 
	COUNT(menu_item_id) AS num_of_dishes,
FROM
	menu_items
WHERE
	category = 'Italian'

SELECT 
	item_name,
	price
FROM
	menu_items
WHERE 
	category = 'Italian'
ORDER BY
	price DESC



/*
How many dishes are in each category? What is the average dish price within each category?
*/

SELECT
	COUNT(menu_item_id) AS num_of_dishes,
    category,
    AVG(price) AS avg_dish_price
FROM
	menu_items
GROUP BY
	category