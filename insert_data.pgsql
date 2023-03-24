-- Insert data into a table

-- Insert a single value

INSERT INTO table_name (
  -- fields in any order
  field_1,
  field_2
) VALUES (
  -- values in the same order and in single quotes
  'value_for_field_1', 
  'value_for_field_2',
)

-- an insert operation will return or log something like 'INSERT 0 1' 
  -- where the first number is the number of updates
  -- second number is the number of insertions