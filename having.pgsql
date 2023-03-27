-- HAVING is used to filter aggregrated groups
-- Used with GROUP BY
-- It is basically post aggregation filtering of the groups and not the rows in the groups
-- to filter rows, use WHERE which runs before GROUP BY


SELECT ANY_AGGREGATE_FUNCTION(...fields) GROUP BY field_one, field_two HAVING [condition]

-- example

SELECT type, COUNT(type) FROM ingredients GROUP BY type HAVING COUNT(type) > 10;