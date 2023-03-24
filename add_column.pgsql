-- Create a table in an existing table
-- We use alter table for this

ALTER TABLE table_name ADD COLUMN column_name DATA_TYPE;

-- Examples

ALTER TABLE ingredients ADD COLUMN image VARCHAR ( 255 );


-- TODO: find ways to handle adding a not null column. We have to tell postgresql how to handle existing records
   
