-- References
-- https://sql.holt.courses/lessons/query-performance/partial-indexes
-- from https://www.postgresql.org/docs/current/indexes-partial.html

-- Partial index is when we don't index on all the rows/records.
-- Let's say for example, we have movie names both in the English langauge and the German language
-- Assume there is another column that describes which language it is)
-- We can actually index on just the english movies

-- We can do this by adding a WHERE clause when creating an index 

CREATE INDEX index_name ON table_name(indexing_field) WHERE filter_indexing_field;

-- example

-- from https://www.postgresql.org/docs/current/indexes-partial.html

CREATE INDEX idx_en_category_names ON category_names(language) WHERE language = 'en';

-- from https://www.postgresql.org/docs/current/indexes-partial.html

CREATE INDEX access_log_client_ip_ix ON access_log (client_ip)
WHERE NOT (client_ip > inet '192.168.100.0' AND
           client_ip < inet '192.168.100.255');