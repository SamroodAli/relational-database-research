-- References:

-- https://sql.holt.courses/lessons/views/materialized-views

-- https://www.postgresql.org/docs/current/sql-refreshmaterializedview.html

-- https://stackoverflow.com/questions/33561984/why-does-refresh-materialised-view-concurrently-block-inserts-updates#:~:text=It%20locks%20the%20materialized%20view,being%20updated%2C%20per%20the%20manual.

-- Unlike views ( refer views), materialized views are a tool for performance

-- This is used to do caching at the database layer.


-- Syntax to create

CREATE MATERIALIZED VIEW materialized_view_name AS query;

-- we can also not populate the cache immediately but create the materialized view by adding WITH NO DATA

CREATE MATERIALIZED VIEW materialized_view_name AS query WITH NO DATA 
-- has no data, we have to populate it first before using this;
-- This can be useful if we want to create the materialized view first and then populate it 
-- during a down time

-- Example

CREATE MATERIALIZED VIEW
  actor_categories

AS

SELECT
  arm.person_name, ecn.name AS keyword, COUNT(*) as count
FROM
  actors_roles_movies arm

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

WITH NO DATA;

--  In order to populate a materialized view, we can run the following command

REFRESH MATERIALIZED VIEW unpopulated_materialized_view_name;

-- We have to  populate our materialzed view from our example above to use it.
-- Also materialized views do get stale over time (when the underlying table's data has changed)
-- So to update or to populate materialized views, we can use the following query:

-- syntax

REFRESH MATERIALIZED VIEW materialized_view_name;

-- example

REFRESH MATERIALIZED VIEW actor_categories;

-- whenever we run REFRESH MATERIALIZED VIEW, it locks the view, hence this should done in down time.
-- When the materialized view is locked, no other user can access this materialized view.
-- We can use REFRESH with CONCURRENTLY to allow the refresh to proceed 
-- without preventing SELECT queries on the view while is being updated.

REFRESH MATERIALIZED VIEW CONCURRENTLY actor_categories;

        --from  https://stackoverflow.com/questions/33561984/why-does-refresh-materialised-view-concurrently-block-inserts-updates#:~:text=It%20locks%20the%20materialized%20view,being%20updated%2C%20per%20the%20manual.


-- We can index materialized views to increase performance

CREATE INDEX index_name ON materialized_view_name (field/expression);

-- example

CREATE index actor_categories_count_idx ON actor_categories (count DESC NULLS LAST) -- whatever is inside the parenthesis the cache key, so when we run the query later, it has to be exactly this field/expression. [verification needed]

-- usage

SELECT * FROM actor_categories ORDER BY count DESC NULLS LAST LIMIT 10; -- notice that it's the same expression DESC NULLS LAST