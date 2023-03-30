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
