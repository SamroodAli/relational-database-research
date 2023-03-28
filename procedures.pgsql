-- References
-- https://sql.holt.courses/lessons/functions-triggers-and-procedures/functions

-- Procedures are like functions that do not return anything
-- they are meant to do actions
-- we invoke them with "CALL"

CREATE PROCEDURE
  procedure_name()
LANGUAGE
  SQL -- or plpgsql or anythign but does not return anything
AS
$$
-- some action
$$;

CALL procedure_name();

-- example

CREATE PROCEDURE
  set_null_ingredient_images_to_default()
LANGUAGE
  SQL -- we can use plpgsql or other supported programming languages
AS
$$
  UPDATE
    ingredients
  SET
    image = 'default.jpg'
  WHERE
    image IS NULL;

-- invoking this procedure
CALL set_null_ingredient_images_to_default();

-- not recommended like functions as they are hard to track just like functions