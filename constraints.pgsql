-- We can add constraints to tables.
-- Constraints are exactly what they sound like, rules that must be satisfied 
-- when adding, removing,mutating data.
-- Primary key is a constraint becase the foreign table should have that record
-- Unique -- is a constraint because the table can have only one such record
-- Combo primary key:
-- CONSTRAINT constraint_name PRIMARY KEY (field_one,field_two) etc -- is also a constraint
-- Check is a constraint that checks something , 
  -- like check if the value is a given list or something equals/greater than something else

-- References
-- https://sql.holt.courses/lessons/joins-and-constraints/constraints

-- When creating the table

CREATE TABLE table_name(
  id INT NOT NULL, --example field
  type VARCHAR(50), -- example field, comma is needed at the end before constraints
  status VARCHAR (50), -- example field

  -- we don't need the constraint keyword but we use it to give a name for the constraint

  CONSTRAINT some_name WHATEVER_CONSTRAINT

  -- examples

  CONSTRAINT table_name_pk  PRIMARY (id),
  CONSTRAINT enum_check CHECK (other_field IN ('success','error')),

  -- we can have constraints without a name as well

  CHECK (status in ('pending','resolved','rejected')) -- This will be given a 
  -- generic name such as table_name_check, if there are more than one check, 
  -- it would be something like table_name_check1, table_name_check2 etc. But 
  -- this is not recommended, add a name for the constraint for better error messages
)


-- add constraints in an existing table
-- if the constraint fails for existing data, the constraint can't be added.

ALTER TABLE table_name(
  -- Alter tables work almost the same except they need the keyword "ADD" before 
  -- constraint and we can add a constraint without prepending the ADD CONSTRAINT keywords

  ADD CONSTRAINT some_name WHATEVER_CONSTRAINT

  -- examples

  ADD CONSTRAINT table_name_pk  PRIMARY (id),
  ADD CONSTRAINT enum_check CHECK (other_field IN ('success','error')),

  -- we can have constraints without a name as well

  CHECK (status in ('pending','resolved','rejected')) -- This will be given a 
  -- generic name such as table_name_check, if there are more than one check, 
  -- it would be something like table_name_check1, table_name_check2 etc. But 
  -- this is not recommended, add a name for the constraint for better error messages
)



