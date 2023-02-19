-- SOLUTIONS TO PIZZA METRICS

-- QUESTION 1
-- How many pizzas were ordered?

SELECT COUNT(pizza_id) AS pizza_ordered_count
FROM pizza_runner.customer_orders;

-- QUESTION 2
-- How many unique customer orders were made?

SELECT COUNT(DISTINCT customer_id) AS unique_customer_count
FROM pizza_runner.customer_orders;

-- QUESTION 3
-- How many successful orders were delivered by each runner?

SELECT runner_id, COUNT(*) AS count_of_successful_orders
FROM pizza_runner.runner_orders
WHERE cancellation IS NULL
OR cancellation = "null" 
OR cancellation = ""
GROUP BY runner_id;

-- QUESTION 4
-- How many of each type of pizza was delivered?

-- QUESTION 5
-- How many Vegetarian and Meatlovers were ordered by each customer?

-- QUESTION 6
-- What was the maximum number of pizzas delivered in a single order?

-- QUESTION 7
-- For each customer, how many delivered pizzas had at least 1 change and how many had no changes?

-- QUESTION 8
-- How many pizzas were delivered that had both exclusions and extras?

-- QUESTION 9
-- What was the total volume of pizzas ordered for each hour of the day?

-- QUESTION 10
-- What was the volume of orders for each day of the week?