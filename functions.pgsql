-- Functions are like functions in programming languages
-- They return something
-- If we don't need them to return something, we can use procedures
-- We call them using SELECT 

-- Let's take a look at a query

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

-- But suppose we want to use this in multiple places and we want the count to be between different
-- numbers, we can use functions to do this, taking in arguments.

CREATE OR REPLACE FUNCTION
  get_recipes_with_ingredients(low INT, high INT)
RETURNS
  SETOF VARCHAR
LANGUAGE
  plpgsql -- programming language postgresql, this can be javascript and many other languages as well
AS
-- $$ are quotes, like single quotes, double quotes,we have dollar quotes
-- they work like single quotoes but we don't need to escape single quotes inside dollar quotes.
$$
BEGIN -- this is like the function body curly braces
  RETURN QUERY SELECT -- we are returning a query
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
    COUNT(r.title) between low and high; -- low and high are arguments we passed in. so we are using variables here
END;
$$;

-- we can invoke this with select

SELECT * FROM get_recipes_with_ingredients(1,5);

-- this is not recommended as it is hard to track functions in your database
-- as it might not be in code or in source control. 