-- Create a table in an existing table
-- We use alter table for this

ALTER TABLE table_name ADD COLUMN column_name DATA_TYPE [FIELD_CONSTRAINTS];

-- We can add multiple columns

ALTER TABLE table_name 
  ADD COLUMN column_one_name DATA_TYPE [COLUMN_ONE_FIELD_CONSTRAINTS],
  ADD COLUMN column_two_name DATA_TYPE [COLUMN_TWO_FIELD_CONSTRAINTS]

-- Examples

-- adding a column

ALTER TABLE ingredients ADD COLUMN image VARCHAR ( 255 );

-- adding multiple columns 
-- including a NOT NULL column with default values for existing records

ALTER TABLE ingredients
  ADD COLUMN image VARCHAR ( 255 ),
  ADD COLUMN type VARCHAR ( 50 ) NOT NULL DEFAULT 'vegetable';
   
