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

-- The query below changes duration and distance column in the runner_orders column from "varchar" datatypes to int
-- while also removing the unit "km" and "minutes" from each values,

UPDATE runner_orders
SET distance = TRIM(REPLACE(distance, "km", ""));

ALTER TABLE runner_orders
MODIFY distance float;

ALTER TABLE runner_orders
RENAME COLUMN distance TO distance_km;

ALTER TABLE runner_orders
RENAME COLUMN duration TO duration_mins;

UPDATE runner_orders
SET duration_mins = TRIM(REPLACE(duration_mins, "minutes", ""));

UPDATE runner_orders
SET duration_mins = TRIM(REPLACE(duration_mins, "minute", ""));

UPDATE runner_orders
SET duration_mins = TRIM(REPLACE(duration_mins, "mins", ""));

ALTER TABLE runner_orders
MODIFY duration_mins int;
