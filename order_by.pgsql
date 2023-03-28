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


-- when ordering , by default nulls show up first in asc and last in desc
-- nulls first is the default for DESC order and nulls last otherwise.
-- so when we do biggest to smallest (desc), we get nulls, first. we can avoid this in a couple of ways

-- using COALESCE

SELECT * FROM table_name
ORDER BY COALESCE(field,0) DESC  -- this will make the field 0 if it is null

-- using nulls first or last

SELECT * FROM table_name
ORDER BY field DESC NULLS LAST  -- this will make nulls show up the end

SELECT * FROM table_name
ORDER BY field DESC NULLS FIRST  -- this will make nulls show up the end