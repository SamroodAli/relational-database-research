-- References
-- https://sql.holt.courses/lessons/query-performance/derivative-value-indexes
-- https://www.postgresql.org/docs/current/indexes-expressional.html

-- Indexing on computed fields (aka Derived value) / indexing on expressions

-- Syntax

CREATE INDEX ON table_name (derived_value);

-- example

-- from https://sql.holt.courses/lessons/query-performance/derivative-value-indexes:
-- suppose we have a query like this where profit is the derived value;

EXPLAIN ANALYZE SELECT
  name, date, revenue, budget, COALESCE((revenue - budget), 0) AS profit
FROM
  movies
ORDER BY
  profit DESC
LIMIT 10;

-- we can create an index on this like this

CREATE INDEX idx_movies_profit ON movies (COALESCE((revenue - budget), 0)); -- indexing on COALESCE((revenue - budget), 0)


-- from https://www.postgresql.org/docs/current/indexes-expressional.html:
-- if we have a query like this:

SELECT * FROM test1 WHERE lower(col1) = 'value';

-- we can index on 

CREATE INDEX test1_lower_col1_idx ON test1 (lower(col1));
