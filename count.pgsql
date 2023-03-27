-- COUNT counts the number of items given as the argument

SELECT COUNT(*) FROM table_name; -- gives us the number of rows

-- example

SELECT COUNT(*) FROM students; -- the number of students

-- count distinct data
SELECT COUNT(DISTINCT field_one) FROM table_name; -- will return how many unique items there are in the field

-- example

SELECT COUNT(DISTINCT batch) FROM students; -- returns the number of batches present, if we remove distinct, it will count duplicate batches

-- We can combine count with aggregation

SELECT field_one, COUNT(field_one) FROM table_name GROUP BY field_one;
-- This will create groups based on the field_one field and then return the number of items in each group