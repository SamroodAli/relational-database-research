-- Foreign keys help us maintain integrity in a database

CREATE TABLE parent (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITIY,
  -- other fields
)

-- child tables for example, but it can be any relationship
CREATE TABLE (
  -- other fields
  parent_id INT REFERENCES parent(id) ON DELETE  x -- where x is  (this is when deleting parent/foreign records)
  -- SET NULl     -- sets the column to be null if the parent is deleted
  -- SET DEFAULT  -- sets a default foreign key fail if the foreign key that doesn't exit.
  -- CASCADE      -- deletes the rows referencing the parent being deleted
  -- RESTRICT     -- prevents the deletion no error
  -- NO ACTION    -- default, prevents the deletion and error is thrown,
  -- there is another nuanced difference between NO ACTION AND RESTRICT
  -- The essential difference between these two choices is that NO ACTION allows the check to be deferred until later in the transaction, whereas RESTRICT does not. -- From the docs (https://www.postgresql.org/docs/current/ddl-constraints.html)

)