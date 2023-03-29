-- Reference
-- https://sql.holt.courses/lessons/query-performance/explain
-- https://scalegrid.io/blog/postgres-explain-cost/
-- https://www.postgresql.org/docs/current/sql-explain.html


-- We can use EXPLAIN  AND EXPLAIN ANALYZE to profile queries

-- It gives information on the cost of the query, the time it took and other useful information

-- These do not show the actual query results but only the analysis

-- print an analysis of the query
EXPLAIN query

-- example

EXPLAIN SELECT * FROM table_name WHERE name = 'something';

-- Print more detailed analysis of the query

EXPLAIN ANALYZE query;

-- example
EXPLAIN ANALYZE SELECT * FROM table_name WHERE name = 'something';

-- The numbers depend on the computer and other factors, and aren't exact or the same for everyone.


-- Sometimes queries can be cached if run the same query multiple times

EXPLAIN (BUFFERS) query -- anaylze does not need the parenthesis but buffers do

-- we can combine this with analyze

EXPLAIN (ANALYZE, BUFFERS) query

-- see other options here
-- https://www.postgresql.org/docs/current/sql-explain.html