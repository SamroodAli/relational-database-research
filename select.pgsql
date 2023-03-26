-- querying or selecting records from a table

-- Select all fields ( not recommended, not readable, hard to get developer intent )

SELECT * FROM table_name;

-- example

SELECT * FROM ingredients;

-- SELECT specific fields from a table

SELECT field_one, field_two FROM table_name;

-- example

SELECT title, image FROM ingredients;

-- Select distinct fields
-- distinct returns the first instance if there are duplicates

SELECT DISTINCT fields FROM table_name

-- if we specify multiple fields, it will return the first record from each group
-- if we are select field_one, field_two, all the distinct field_one + field_two combos show up
-- example 
  -- dept - expenses
  -- sales - 40       
  -- sales - 30       -- here even though sales occured once, sales + 30 hasn't occured yet.
  -- purchase - 20

