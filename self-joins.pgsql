-- References
-- https://sql.holt.courses/lessons/self-join/self-join

-- Self join is nothing special, just treating the same table as two different tables.
-- For this, we will need to give the same table two different aliases

-- Syntax

SELECT something FROM table_A as table_A_one_name
INNER JOIN table_A as table_A_another_name-- same table but different alias
ON table_A_one_name.some_field = table_A_another_name.some_other_field;

-- Example from https://sql.holt.courses/lessons/self-join/self-join

-- The same category can have different names in different languages.
-- this is the table showing names in different languages for categories, 
-- where each record is a category name in a different language which refers to a category with the foreign key category_id.
-- i,e a category can have many category names
-- Example: the category 'Space Opera' is 'Space Opéra' in French,'Space Opera' in English and 'Kosmiczna opera' in Poland

-- Task is to fetch all the german category names that doesn't have an english version.

-- We are joining each german category name FROM the left table with the same categories table ( the right table)
-- on having the same category id (i,e referring to the same category) where the second language is 'en'
-- and since this is a LEFT JOIN,
    -- there would be categories that aren't german ( from the left table since this is a LEFT JOIN) ( should be filtered)
    -- and german categories that has an english version (joining condition) (should be filtered)
    -- categories that are german but doesn't have a english version (c2 language is not 'en')( again because this is a LEFT JOIN) (what we want)

SELECT
  c1.category_id, c1.language AS de_lang, c1.name as de_name, c2.language AS en_lang, c2.name AS en_name
FROM
  category_names c1

LEFT JOIN
  category_names c2
ON
  c1.category_id = c2.category_id
AND
  c2.language = 'en'

WHERE
  c2.language IS NULL -- works because this is left join and has many records that failed the joining condition ( where c2 language is not 'en')
AND
  c1.language = 'de'

LIMIT 50;