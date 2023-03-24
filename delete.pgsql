-- Delete records from a table
-- logs DELETE followed by the number of deletions
-- example: DELETE 10 -- means deleted 10 records

DELETE FROM table_name
WHERE condition

RETURNING *; -- or RETURNING field_one, field_two -- returns selected fields after the operation. Star ( * ) returns every field


-- Example