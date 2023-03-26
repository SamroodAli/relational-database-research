-- There are different kinds of joins
-- Inner and outer
-- ANd outer is further split into 
  -- Left outer join or left join
  -- Right outer join or right join
  -- Full outer join or full join

-- Besides these, there's also natural joins and cross join
-- Natural join joins on common columns (Not recommended as this is ambigous)
-- Cross join that gives you every permutation (every row with every other row in the table)( Not recommended as this is expensive)

-- Inner Join
-- returns related records only

-- See the set relations for joins here 👇
-- https://commons.wikimedia.org/wiki/File:SQL_Joins.svg

-- INNER JOIN syntax
SELECT fields FROM 
    table_A table_A_alias 
  INNER JOIN
    table_B table_B_alias 
  ON [condition]

-- inner keyword can be left out as this is the default join

-- example

SELECT title, body FROM
    recipes recipe
  INNER JOIN
    recipes_photos photo
  ON
    photo.recipe_id = recipe.id;


-- outer left syntax
SELECT fields FROM
    table_a table_a_alias 
  OUTER LEFT JOIN
    table_b table_b_alias 
  ON [condition]

-- outer keyword can be left out as left join is always an outer join.

-- example

SELECT title, body FROM
    recipes recipe
  LEFT JOIN
    recipes_photos photo
  ON
    photo.recipe_id = recipe.id;


-- outer right syntax
SELECT fields FROM
    table_a table_a_alias 
  OUTER RIGHT JOIN
    table_b table_b_alias 
  ON [condition]

-- outer keyword can be left out as right join is always an outer join.

-- example

SELECT title, body FROM
    recipes recipe
  RIGHT JOIN
    recipes_photos photo
  ON
    photo.recipe_id = recipe.id;

-- outer full join syntax
SELECT fields FROM
    table_a table_a_alias 
  OUTER FULL JOIN
    table_b table_b_alias 
  ON [condition]

-- outer keyword can be left out as left join is always an outer join.

-- example

SELECT title, body FROM
    recipes recipe
  FULL JOIN
    recipes_photos photo
  ON
    photo.recipe_id = recipe.id;

-- Natural join example

SELECT fields FROM 
    table_a table_a_alias
  NATURAL JOIN
    table_b table_b_alias

-- Natural join example

SELECT title, body FROM 
    recipes
  NATURAL JOIN
    recipes_photos

-- If there is no common columns, it becomes a cross join.
    
-- Cross join

SELECT fields FROM 
    table_a table_a_alias
  CROSS JOIN
    table_b table_b_alias

-- Cross join example

SELECT * FROM
  ingredients
    CROSS JOIN
  recipes;
  