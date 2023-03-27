-- JSONB -- better JSON data type

-- when creating a table

CREATE TABLE (
  -- other fields
  field_name JSONB [ANY_OTHER_FIELD_CONSTRAINTS]
)

-- when updating a table

ALTER TABLE ADD COLUMN field_name JSONB [ANY_OTHER_FIELD_CONSTRAINTS]
  

-- adding

INSERT INTO table_name (jsonb_field) VALUES (
  -- valid json in single quotes
  'valid_json_here'
)

-- example

INSERT INTO ingredients (meta) VALUES (
  -- valid json in single quotes
'{ "tags": ["dessert", "fruit"] }'
)

-- updating

UPDATE
  table_name
SET
  -- valid json in single quotes
  field_name = 'valid_json_here'
WHERE
  condition;

-- example

UPDATE
  recipes
SET
  -- valid json in single quotes
  meta='{ "tags": ["dessert", "fruit"] }'
WHERE
  recipe_id=47;
