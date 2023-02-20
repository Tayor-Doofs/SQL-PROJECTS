-- DATA CLEANING

-- The query below changes blank cells and cells equal to "null"
-- in the exclusions and extras column to NULL

UPDATE customer_orders
SET exclusions = NULL
WHERE exclusions = "null" OR exclusions = "";

UPDATE customer_orders
SET extras = NULL
WHERE extras = "null" OR extras = "";