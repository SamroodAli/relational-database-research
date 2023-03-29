-- References
-- https://sql.holt.courses/lessons/query-performance/gin

-- GIN indexes are really useful for text searches and other cases where multiple key words refer to one record.
-- like both the word "tron" and 'legacy' referring to 'tron legacy'.
-- It is also useful for JSONB columns where we have arrays of values and to search for an item in them.

-- creating an index

CREATE INDEX index_name ON table_name USING GIN(field_one) -- can take one or more fields

-- DROP index

DROP INDEX index_name

-- you can use \d table_name to describe a table including it's indexes

-- if need to index a JSONB field, use GIN as GIN and JSONB always work well together

-- There are some algorithms for Gin index

-- Trigam

-- Trigram is all permutation of substrings of length 3 ( hence the word TRI )
-- the string 'samrood' would have the following permutations
--  "  s"," sa","amr","mro","od ","ood","roo","sam" -- contiguous and can include empty strings

-- you can see the trigram permutations for a string using 
SELECT SHOW_TRGM('any_string');


-- we can create a GIN index that uses trigrams

CREATE INDEX index_name ON movies USING GIN(field GIN_TRGM_OPS); -- there's no comma after the field, 
-- and GIN_TRGM_OPS is the method name.

-- example
CREATE INDEX samrood ON movies USING gin(name GIN_TRGM_OPS);

-- this is useful for queries such as 
SELECT name FROM movies WHERE name like '%star wars%';

-- creating GIN index is very expensive and might cause down time in production

-- we can also partial index, check out the notes on partial index