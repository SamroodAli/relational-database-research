-- There are some helpers to query JSONB

-- References
-- https://sql.holt.courses/lessons/jsonb/jsonb

-- OBJECT DOT NOTATION with ->

-- It works like the dot notation, useful for accessing a field AT THE TOP level 
-- suppose our table has a json field which has schema like this  {"foo":["data1","data2","data3"]}

SELECT jsonb_field -> foo FROM table_name; -- gives us json_field.foo

-- ARRAY INDEXING with -> 
-- We can also use get array values using an index
-- suppose our table has a json field which has schema like this  {"foo":["data1","data2","data3"]}

SELECT jsonb_field -> foo -> 0 FROM table_name; -- will be like field_data.foo[0] giving us "data1" in the example above
-- the data is still a json string and will be returned as "data1",
-- use the ->> if we want to process this as given below

-- Processing the data with ->>

-- In the earlier query, we were returing json at the end with ->, if we want to process it,
-- we can use the ->> operator

SELECT jsonb_field -> foo ->> 0 FROM table_name; -- will be like processed field_data.foo[0]
--  giving us data1 in the example above

-- SEARCHING JSON with ?

-- We can combine the where clause with JSONB '?' search. '? search' works like ternary operator but for searching
-- THIS IS SEARCHING THE TOP LEVEL, not a nested search.

SELECT jsonb_field -> 'foo' FROM table_name WHERE meta ? 'foo' 
-- this is searching fro all jsonb_fields where there is a 'foo' field.

-- This can used at any level but only searches for the TOP level there

SELECT jsonb_field -> 'foo' -> 'bar' FROM table_name WHERE meta -> 'foo' -> 'bar'
-- this is accessing the field_data.foo.bar if field_data.foo.bar exists

-- This can also be used to search arrays
-- suppose our table has a json field which has schema like this  {"foo":["data1","data2","data3","data4"]}

-- we can select the field if the field has 'data3' like this

SELECT jsonb_field -> 'foo' WHERE jsonb_field -> foo ? 'data3'; -- returns the foo field where the array contains the top level key 'data3'. // array number based index gives us the value we can use array values to check or search if they exist

-- SEARCHING with @> 
-- @> is checking whether the array contains
-- duoble quotes here are necessarily are we are searching for the json string "data3". the single quote outside shows that we are searching for a value.

SELECT jsonb_field  -> 'foo'  WHERE jsonb_field -> foo @> '"data3"'; -- returns records where the field.foo array contains "data3"