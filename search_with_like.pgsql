--  we can search and retrieve string fields with the LIKE operator

SELECT * FROM table_name
-- any one of the below three - these are case sensitive. -- values to like are all in SINGLE QUOTES
  WHERE name like '%ends_with' -- ends with ali  -- case sensisitive here would mean this does not match with 'samrood Ali'
  WHERE name like 'stars_with%' -- starts with sam
  WHERE name like '%somewhere%' -- has roo somewhere 

-- example

SELECT * FROM ingredients
  WHERE title LIKE 'pot%' -- starts with pot

--  to solve case sensitivity, we can transform the field to lower case or upper case first before checking

SELECT * FROM table_name
  WHERE LOWER(name) like '%lower_case_check';


-- Examples

SELECT * FROM ingredients 
  WHERE UPPER(title) LIKE '%POT%' -- values and the function should correlate

SELECT * FROM ingredients 
  WHERE LOWER(title) LIKE '%pot%' -- values and the function should correlate

-- We can also use ILIKE (case insensitive LIKE ) to match case insensitive

SELECT * FROM table_name 
  WHERE title ILIKE '%wHaTeVer%' -- this does a case insensitive catch

-- We can also search something in more than one fields by using concat

SELECT * FROM table_name
  WHERE CONCAT(field_one,field_two) ILIKE '%search_keyword%' -- this will search in both field_one and field_two;


-- Example

SELECT * FROM ingredients
  WHERE CONCAT(title, fruit) ILIKE '%fruit%' -- this will return all the records where  "title" + "fruit" (conctenated fields) has the word fruit in it

-- This is literally concatenation so "orange" + "fruit" will be a match for the string "gefru"