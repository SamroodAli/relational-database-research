-- We can group rows based on something
-- Needed to use aggregration functions
-- Group by RETURNS ROWS OF GROUPS
-- a group by is always going to be accompanied with some aggregation functions
-- these aggregation functions run on each group - each row

SELECT AGGREGRATION_FUNCTION(field_one) FROM table_name GROUP BY field_one, field_two;

-- We can filter aggregations with HAVING

SELECT AGGREGRATION_FUNCTION(field_one) FROM table_name GROUP BY field_one, field_two HAVING condition;

-- Examples

SELECT type, COUNT(type) FROM ingredients GROUP BY type;
