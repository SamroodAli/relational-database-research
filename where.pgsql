-- Where clause is used for filter

SELECT .....
WHERE condition

-- some examples for where clause

SELECT * FROM ingredients

WHERE id = 1
WHERE id <> 1 -- where id not equal to 1
WHERE id > 1
WHERE id <= 1
WHERE id < 1
WHERE Id >= 1

-- we can also use with logical operators
WHERE id >=10 AND id <= 20

WHERE type = 'fruit' OR type = 'vegetable'

WHERE type = 'fruit' OR (type = 'vegetable' AND id >= 100);