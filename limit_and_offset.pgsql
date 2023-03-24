-- MAX LIMIT the number of records with LIMIT

SELECT field_one FROM ingredients LIMIT number_of_records_to_return

-- example

SELECT title FROM ingredients LIMIT 10; -- will only return at max 10 records.

-- We can set an offset with OFFSET

SELECT field_one FROM table_name OFFSET number_of_records_to_offset

-- example

SELECT title FROM ingredients OFFSET 20; -- will skip 20 records

-- we can combine to do pagination 

SELECT field_one FROM table_name OFFSET number_to_offset LIMIT max_number_of_records_to_show;