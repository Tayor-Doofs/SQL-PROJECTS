-- SOLUTIONS TO INGREDIENT OPTIMIZATION QUESTIONS

-- QUESTION 1
-- What are the standard ingredients for each pizza?

SELECT pizza_name, group_concat(topping_name) AS standard_ingredients
FROM (SELECT n.pizza_name, r.toppings, t.topping_name
	FROM pizza_runner.pizza_recipes1 r
	JOIN pizza_runner.pizza_names n
	USING (pizza_id)
	JOIN pizza_runner.pizza_toppings t
	ON r.toppings = t.topping_id
    ) x
GROUP BY pizza_name;


-- QUESTION 2
-- What was the most commonly added extra?

with cte as (
SELECT n.num, SUBSTRING_INDEX(SUBSTRING_INDEX(all_tags, ',', num), ',', -1) as one_tag
FROM (
	  SELECT
		GROUP_CONCAT(extras SEPARATOR ',') AS all_tags,
		LENGTH(GROUP_CONCAT(extras SEPARATOR ',')) - LENGTH(REPLACE(GROUP_CONCAT(extras SEPARATOR ','), ',', '')) + 1 AS count_tags
	  FROM pizza_runner.customer_orders
	) t
JOIN numbers n
ON n.num <= t.count_tags)

select one_tag as Extras,pizza_toppings.topping_name as ExtraTopping, count(one_tag) as Occurrencecount
from cte
inner join pizza_toppings
on pizza_toppings.topping_id = cte.one_tag
where one_tag != 0
group by one_tag;


-- QUESTION 3
-- What was the most common exclusion?

with cte as (
SELECT n.num, SUBSTRING_INDEX(SUBSTRING_INDEX(all_tags, ',', num), ',', -1) as one_tag
FROM (
	  SELECT
		GROUP_CONCAT(exclusions SEPARATOR ',') AS all_tags,
		LENGTH(GROUP_CONCAT(exclusions SEPARATOR ',')) - LENGTH(REPLACE(GROUP_CONCAT(exclusions SEPARATOR ','), ',', '')) + 1 AS count_tags
	  FROM pizza_runner.customer_orders
	) t
JOIN numbers n
ON n.num <= t.count_tags)

select one_tag as Exclusions,pizza_toppings.topping_name as ExcludedTopping, count(one_tag) as Occurrencecount
from cte
inner join pizza_toppings
on pizza_toppings.topping_id = cte.one_tag
where one_tag != 0
group by one_tag;

-- QUESTION 4
-- Generate an order item for each record in the customers_orders table in the format of one of the following:
-- * Meat Lovers
-- * Meat Lovers - Exclude Beef
-- * Meat Lovers - Extra Bacon
-- * Meat Lovers - Exclude Cheese, Bacon - Extra Mushroom, Peppers

SELECT co.customer_id, ROUND(AVG(distance_km),2) AS average_distance_travelled
FROM pizza_runner.runner_orders ro
JOIN pizza_runner.customer_orders co
USING (order_id)
GROUP BY co.customer_id;

-- QUESTION 5
-- Generate an alphabetically ordered comma separated ingredient list for each pizza order from the customer_orders table and add a 2x in front of any relevant ingredients
-- For example: "Meat Lovers: 2xBacon, Beef, ... , Salami"

SELECT CONCAT(MAX(duration_mins) - MIN(duration_mins), " minutes") AS MaxMinDelvTimeDiff
FROM pizza_runner.runner_orders ro;

-- QUESTION 6
-- What is the total quantity of each ingredient used in all delivered pizzas sorted by most frequent first?

SELECT runner_id, ROUND(AVG(distance_km/(duration_mins/60)),2) AS average_speed
FROM pizza_runner.runner_orders ro
GROUP BY runner_id;
