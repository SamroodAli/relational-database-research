-- References
-- https://sql.holt.courses/lessons/views/basic-views

-- Views are like creating a virtual table that has access to real tables used to create the view.
-- Views are often called a named query and the underlying tables are called base tables.
-- This is useful to abstract away complex queries.

-- Syntax

CREATE VIEW view_name AS any_select_query;

-- example

CREATE VIEW english_category_names AS  SELECT * FROM category_names WHERE langage = 'en'; -- will give us a virtual table
-- that shows only the english category names

-- views show up when we describe a table with '\d table_name' command.

-- we can query a view using SELECT 

SELECT * FROM view_name; -- works with SELECT just like a table_name;

-- We can describe a view just like a table by using '/d view';

-- We can also insert into a view
-- It gets added to the underlying base tables

INSERT INTO view_name (field_one,field_two) VALUES('value_one','value_two');
-- This gets added to the underlying table

-- No validation happens here even if the view was built with a where clause

-- i.e, if we have this query for english category names
CREATE VIEW english_category_names AS  SELECT * FROM category_names WHERE langage = 'en'; 

-- we can still insert into it category names that aren't english

-- this is valid:
INSERT INTO english_category_names (name,language) VALUES ('some_italian_category','it') -- it for italian

-- You can also do update or delete operations on views. They are just like any other tables

-- view with joins example
-- from https://sql.holt.courses/lessons/views/basic-views

CREATE VIEW
  actors_roles_movies
AS
SELECT
  p.name AS person_name, c.role, m.name AS movie_name, p.id AS person_id, m.id AS movie_id
FROM
  people p

INNER JOIN
  casts c
ON
  p.id = c.person_id

INNER JOIN
  movies m
ON
  c.movie_id = m.id

WHERE
  c.role <> '';

-- joining views example from https://sql.holt.courses/lessons/views/basic-views

SELECT
  arm.person_name, ecn.name AS keyword, COUNT(*) as count
FROM
  actors_roles_movies arm -- this is a view that we created in the example above

INNER JOIN
  movie_keywords mk
ON
  mk.movie_id = arm.movie_id

INNER JOIN
  english_category_names ecn
ON
  ecn.category_id = mk.category_id

GROUP BY
  arm.person_name, ecn.name

ORDER BY
  count DESC

LIMIT 20;