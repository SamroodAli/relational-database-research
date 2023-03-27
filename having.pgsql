-- HAVING is used to filter aggregrated groups
-- Used with GROUP BY
-- It is basically post aggregation filtering of the groups and not the rows in the groups
-- to filter rows, use WHERE which runs before GROUP BY

SELECT ANY_AGGREGATE_FUNCTION(...fields) GROUP BY field_one, field_two HAVING [condition]

-- examples

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