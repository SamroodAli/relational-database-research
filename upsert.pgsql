-- Insert data into a table

-- Insert a single record

INSERT INTO table_name (
  -- fields in any order
  field_1,
  field_2
) VALUES (
  -- values in the same order as the fields given and in single quotes
  'value_for_field_1',  -- string values are always in single quotes
  10 -- numbers need no quotes
) ON CONFLICT (conflicting_field)  -- on conflict, we have to give the field where the conflict happened
-- usually it is the unique identifier that broke the constraint
-- the part where we do update if there is  conflict
-- continuing
  DO UPDATE -- telling we are doing an update, we can also DO NOTHING;
  SET field = 'value'; -- update, the value to the given value. 
--but often we want it to the update with the new data we passed. Read that below (excluded keyword)

-- an insert operation will return or log something like 'INSERT 0 1' 
  -- first number is something technical (look up postgresql object identifier)
  -- second number is the number of insertions or upserts

-- USING excluded.data to update with the data we passed instead of literal values

-- We can do this using the keyword 'excluded'--
-- excluded is the record that got excluded (skipped) coz data was already present.
-- in other words, it is the new data

INSERT INTO table_name (
  -- fields in any order
  field_1,
  field_2
) VALUES (
  'value_for_field_1',  -- string values are always in single quotes
  10
) ON CONFLICT (conflicting_field) 
  DO UPDATE 
  SET field = excluded.field;


-- Example

INSERT INTO ingredients (
  title, image, type 
) VALUES (
  'tomoato','tomato.jpg','vegetable'
) ON CONFLICT (title)
  DO UPDATE
  SET image = excluded.image; -- excluded.literal or any literal value


-- Upserting multiple records

INSERT INTO table_name (
  field_1,
  field_2,
) VALUES 
( 'value_for_field_1', 10 ),  -- one record
( 'another_value_for_field_1', 20 ), -- another record
ON CONFLICT (field_1) -- assuming field_1 was unique
DO UPDATE
SET image = excluded.image -- excluded.image or any literal value;


-- Upserting multiple values

INSERT INTO ingredients (
  title, image, type
) VALUES
  ( 'avocado', 'avocado.jpg', 'fruit' ),
  ( 'banana', 'banana.jpg', 'fruit' ),
  ( 'beef', 'beef.jpg', 'meat' ),
  ( 'black_pepper', 'black_pepper.jpg', 'other' ),
  ( 'blueberry', 'blueberry.jpg', 'fruit' ),
  ( 'broccoli', 'broccoli.jpg', 'vegetable' ),
  ( 'carrot', 'carrot.jpg', 'vegetable' ),
  ( 'cauliflower', 'cauliflower.jpg', 'vegetable' ),
  ( 'cherry', 'cherry.jpg', 'fruit' ),
  ( 'chicken', 'chicken.jpg', 'meat' ),
  ( 'corn', 'corn.jpg', 'vegetable' ),
  ( 'cucumber', 'cucumber.jpg', 'vegetable' ),
  ( 'eggplant', 'eggplant.jpg', 'vegetable' ),
  ( 'fish', 'fish.jpg', 'meat' ),
  ( 'flour', 'flour.jpg', 'other' ),
  ( 'ginger', 'ginger.jpg', 'other' ),
  ( 'green_bean', 'green_bean.jpg', 'vegetable' ),
  ( 'onion', 'onion.jpg', 'vegetable' ),
  ( 'orange', 'orange.jpg', 'fruit' ),
  ( 'pineapple', 'pineapple.jpg', 'fruit' ),
  ( 'potato', 'potato.jpg', 'vegetable' ),
  ( 'pumpkin', 'pumpkin.jpg', 'vegetable' ),
  ( 'raspberry', 'raspberry.jpg', 'fruit' ),
  ( 'red_pepper', 'red_pepper.jpg', 'vegetable' ),
  ( 'salt', 'salt.jpg', 'other' ),
  ( 'spinach', 'spinach.jpg', 'vegetable' ),
  ( 'strawberry', 'strawberry.jpg', 'fruit' ),
  ( 'sugar', 'sugar.jpg', 'other' ),
  ( 'tomato', 'tomato.jpg', 'vegetable' ),
  ( 'watermelon', 'watermelon.jpg', 'fruit' )
ON CONFLICT (title)
DO UPDATE
SET image = excluded.image;
