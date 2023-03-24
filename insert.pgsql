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
)

-- an insert operation will return or log something like 'INSERT 0 1' 
  -- first number is something technical (look up postgresql object identifier)
  -- second number is the number of insertions

-- Example

INSERT INTO ingredients (
  title, image, type 
) VALUES (
  'tomoato','tomato.jpg','vegetable'
)


--  Inserting multiple records
-- we can add multiple comma seperated values and each value set being inside parenthesis ()

INSERT INTO table_name (
  field_1,
  field_2,
) VALUES 
( 'value_for_field_1', 10 ),  -- one record
( 'another_value_for_field_1', 20 ), -- another record


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
ON CONFLICT DO NOTHING; -- This is optional if any row has a conflict like a unique constraint fail, skip it ( do nothing )

-- check out upsert if you want update or insert