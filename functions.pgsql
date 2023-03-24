-- There are a bunch of functions in postgresql

-- just like javascript evaluations, you can nest them

SELECT LOWER('Hi') -- returns hi
SELECT UPPER('hi') -- returns HI
SELECT NOW() -- returns time
SELECT CONCAT('hi',' something') -- returns hi + something

-- functions follow referential transparency
-- such as:
SELECT function_one(function_two(field_1, field_2)), function_three(field_3) FROM table_name; -- just an example
-- we can combine functions anyway we can -- just like in javascript

-- example

SELECT LOWER(CONCAT(title,' ',type)), NOW() FROM ingredients;

-- other examples

SELECT * FROM ingredients
  WHERE CONCAT(title, fruit) ILIKE '%fruit%' -- this will return all the records where  "title" + "fruit" (conctenated fields) has the word fruit in it

SELECT * FROM ingredients 
  WHERE UPPER(title) LIKE '%POT%' -- search for POT - all titles are uppercased and then searched

SELECT * FROM ingredients 
  WHERE LOWER(title) LIKE '%pot%' -- search for pot - all titles are lowercased and then searched