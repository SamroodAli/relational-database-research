-- There are two kinds of joins
-- Inner and outer
-- ANd outer is further split into 
  -- Left outer join or left join
  -- Right outer join or right join
  -- Full outer join or full join

-- Inner Join
-- returns related records only


-- See the set relations for joins here 👇
-- https://www.w3schools.com/sql/sql_join.asp

-- INNER JOIN syntax
SELECT fields FROM 
    table_A table_A_alias 
  INNER JOIN
    table_B table_B_alias 
  ON [condition]

-- INNER keyword can be left out as this is the default join

-- example

SELECT title, body FROM
    recipes recipe
  INNER JOIN
    recipes_photos photo
  ON
    photo.recipe_id = recipe.id;


-- OUTER LEFT syntax
SELECT fields FROM 
    table_A table_A_alias 
  OUTER LEFT JOIN
    table_B table_B_alias 
  ON [condition]

-- OUTER keyword can be left out as left join is always an outer join.

-- example

SELECT title, body FROM
    recipes recipe
  LEFT JOIN
    recipes_photos photo
  ON
    photo.recipe_id = recipe.id;


-- OUTER RIGHT syntax
SELECT fields FROM 
    table_A table_A_alias 
  OUTER RIGHT JOIN
    table_B table_B_alias 
  ON [condition]

-- OUTER keyword can be left out as left join is always an outer join.

-- example

SELECT title, body FROM
    recipes recipe
  RIGHT JOIN
    recipes_photos photo
  ON
    photo.recipe_id = recipe.id;

-- OUTER keyword can be left out as right join is always an outer join.