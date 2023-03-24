-- we can sort records using order by
-- an order is not guaranteed in the SQL spec, so don't rely on one. 
-- explicitly add order by if you want ordering.

SELECT * FROM table_name -- any select query
ORDER BY field_name [ASC] DESC -- it is ascending by default, we can skip it. put DESC if we want descending order

-- Example

SELECT * FROM ingredients
ORDER BY id -- orders by asc

SELECT * FROM ingredients
ORDER BY id DESC -- orders by id descending order

-- We can sort strings in lexicographic order

SELECT * FROM ingredients
ORDER BY title DESC -- would be like z, y, x 
-- ORDER BY title would be like a,b,c , aa, ab, etc