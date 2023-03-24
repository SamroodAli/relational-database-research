-- update record(s) in a table
-- returns UPDATE followed by the number of updates
  --  example: UPDATE 1 -- means updated one record

UPDATE table_name
  SET field_one = 'value1',
      field_two = 'value_2'
  -- optionally a filter condition on what all record(s) to update 
  WHERE condition -- not including a where condition will update all the records

-- Example

UPDATE ingredients
  SET image = 'vegetable_placeholder.img'
  WHERE type = 'vegetable';
  
-- if we want to return fields after updating,  we can use the RETURNING clause

UPDATE table_name
  SET field_one = 'value'
  WHERE condition
  RETURN field_one, field_two;

-- Example

UPDATE ingredients
  SET image = 'watermelon.jpg'
  WHERE title = 'watermelon'
  RETURNING id, title ,image;

-- we can also use RETURNING * to return all fields

UPDATE table_name
  SET field_one = 'value'
  WHERE condition
  RETURNING *;


-- example

UPDATE ingredients
  SET image = 'watermelon.jpg'
  WHERE title = 'watermelon'
  RETURNING *;

