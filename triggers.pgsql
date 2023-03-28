-- References
-- https://sql.holt.courses/lessons/functions-triggers-and-procedures/triggers
-- https://www.tutorialspoint.com/postgresql/postgresql_triggers.htm

-- Postgresql triggers are database callback functions
-- they are triggered/invoked when an event occurs

-- there's two parts to this
-- you need a function that returns a trigger
-- register a trigger to listen to an event

-- There's a lot of events which we can listen to like run on updating a record

CREATE  TRIGGER trigger_name [BEFORE|AFTER|INSTEAD OF] event_name
ON table_name
[
  -- Trigger logic goes here....
  --  invoke some function or procedure
];


-- a function that returns a trigger
CREATE OR REPLACE FUNCTION function_name ()
  RETURNS 
    TRIGGER
  LANGUAGE
    -- any language
AS

$$
BEGIN
  -- function logic
END
$$

-- we can drop a trigger

DROP TRIGGER trigger_name;

-- Example

-- Lets say we want to track changes to the recipe title, we need old title and new title
-- and we created a table for this.

CREATE TABLE updated_recipes (
  id INT GENERATED ALWAYS AS IDENTITY,
  recipe_id INT,
  old_title VARCHAR (255), -- old title
  new_title VARCHAR (255), -- new title
  time_of_update TIMESTAMP -- updatedAt
);

-- creating a functon to run on an update to title
CREATE OR REPLACE FUNCTION log_updated_recipe_name()
  RETURNS
    TRIGGER -- return a trigger
  LANGUAGE
    plpgsql
AS
$$
BEGIN
  IF OLD.title <> NEW.title THEN -- checking if title has changed , because this function runs on update to any field
    INSERT INTO -- insert into our new log table
      updated_recipes (recipe_id, old_title, new_title, time_of_update) -- insert old and new title as well as updatedAt and the recipe_id
    VALUES
      (NEW.recipe_id, OLD.title, NEW.title, NOW());
  END IF;
  RETURN NEW; -- return the new record or updating data, we should return what SELECT expects
END;
$$;

-- registering the trigger
CREATE OR REPLACE TRIGGER updated_recipe_trigger
AFTER UPDATE ON recipes 
  FOR EACH ROW EXECUTE PROCEDURE log_updated_recipe_name(); -- run the function for each updated row 
  -- even though we say execute procedure, we are running functions, triggers can't invoke procedures 
  -- but functions can call procedures but such complicated logic is not recommended