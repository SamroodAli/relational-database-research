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

-- concat using ||

SELECT field_one || field_two FROM table_name; -- concats field_one and field_two;

SELECT name || ', ' ||  population AS location FROM cities; -- returns 'name, population';

-- concatenating with CONCAT
-- CONCAT takes in any number of arguments 

SELECT CONCAT(field_one, field_two,field_three) FROM table_name;

-- example

SELECT CONCAT(name,population,area) FROM cities;

-- get length using LENGTH()
-- gets length of the string

SELECT LENGTH(field_one) FROM table_name;

-- example

SELECT title, LENGTH(title) FROM ingredients; -- returns title and length of the title for each row

-- COALESCE function is like the nullish coalescing function in javascript ( value ?? 'default')

SELECT COALESCE(field,'default_value') FROM table_name; -- if a record has null for the field, it will return the given default value;

-- example

SELECT title, COALESCE(image,'default-image.jpg') FROM ingredients; 
-- if an ingredient doesn't have an image, we will return the default image