-- We can group rows based on something
-- Needed to use aggregration functions
-- Group by RETURNS ROWS OF GROUPS
-- a group by is always going to be accompanied with some aggregation functions
-- these aggregation functions run on each group - each row

SELECT AGGREGRATION_FUNCTION(field_one) FROM table_name GROUP BY field_one, field_two;

-- We can filter aggregations with HAVING

SELECT AGGREGRATION_FUNCTION(field_one) FROM table_name GROUP BY field_one, field_two HAVING condition;

-- Examples

-- Get the number of ingredients of a type

SELECT type, COUNT(type) FROM ingredients GROUP BY type;

-- Get the number of ingredients of a type if the count > 10

SELECT type, COUNT(type) FROM ingredients GROUP BY type HAVING COUNT(type) > 10;

-- Get the recipes with the number of ingredients being between 4 and 6

SELECT
  r.title
FROM
  recipe_ingredients ri

INNER JOIN
  recipes r
ON
  r.recipe_id = ri.recipe_id

GROUP BY
  r.title
HAVING
  COUNT(r.title) BETWEEN 4 AND 6;