-- Create a table

CREATE TABLE table_name (
  -- list fields one by one
  field_name DATA_TYPE [FIELD_CONSTRAINS_1] [FIELD_CONSTRAINT_2]
)


-- Examples

CREATE TABLE ingredients (
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(255) UNIQUE NOT NULL -- comma in the last field is not allowed
);
