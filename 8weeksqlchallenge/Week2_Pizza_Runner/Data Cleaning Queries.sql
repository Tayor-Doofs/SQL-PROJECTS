-- DATA CLEANING

-- The query below changes blank cells and cells equal to "null" in
-- the exclusions and extras columns found in the customer orders
-- table to NULL

UPDATE customer_orders
SET exclusions = NULL
WHERE exclusions = "null" OR exclusions = "";

UPDATE customer_orders
SET extras = NULL
WHERE extras = "null" OR extras = "";

-- The query below changes blank cells and cells equal to "null" in
-- the pickup_time, distance, duration, and cancellation columns found
-- in the runner_orders table to NULL

UPDATE runner_orders
SET pickup_time = NULL
WHERE pickup_time = "null" OR pickup_time = "";

UPDATE runner_orders
SET distance = NULL
WHERE distance = "null" OR distance = "";

UPDATE runner_orders
SET duration = NULL
WHERE duration = "null" OR duration = "";

UPDATE runner_orders
SET cancellation = NULL
WHERE cancellation = "null" OR cancellation = "";