-- https://sql.holt.courses/lessons/query-performance/indexes
-- Syntax

-- When creating a table 
-- Making something unique will create an index on it

CREATE TABLE table_name(
  -- other fields
    some_field INT UNIQUE NOT NULL, -- this is now a unique field - also an indexed field
  -- other fields

  UNIQUE (field_one, field_two)     -- this will also create a unique index on one or more fields
)

-- usually we create a table first and then add index

-- creating an index on an existing table

CREATE INDEX index_name ON table_name(field_name,field_two) -- one or more fields

-- drop an index

DROP INDEX index_name;

-- you can use \d table_name to describe a table including it's indexes

-- for index for text searches and JSONB, consider a GIN index (check out notes on GIN index)