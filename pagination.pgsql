-- we can combine LIMIT AND OFFSET to do pagination 

SELECT field_one FROM table_name OFFSET number_to_offset LIMIT max_number_of_records_to_show;

-- example

SELECT id, title FROM ingredients OFFSET 10 LIMIT 10; -- skip 10 records, take 10 records
-- we can only use this if our records were never deleted.
-- if some records were deleted or inserted in between, there is a chance we miss some records due to this method of pagination
-- This method of pagination is also less efficient.
-- cursor based pagination solves this issue.

-- CURSOR BASED PAGINATION
-- more performant
-- Example for cursor based pagination

SELECT field  FROM table_name WHERE id > cursor_id LIMIT max_number_of_records;

-- example

SELECT id, title,  FROM WHERE id > 10  LIMIT 5;