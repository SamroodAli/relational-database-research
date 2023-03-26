-- Many to many relationship needs a third through table
-- Assume there is already table A and B. Primary key is called 'id' in both.
-- This is how we create a many to many relationship between them:
CREATE TABLE table_a_table_b (
    table_a_id INT REFERENCES table_a (id) ON DELETE x -- where x is what to do on delete -- CASCADE, SET NULL etc,-- refer foreign keys
    table_b_id INT REFERENCES table_b (id) ON DELETE y --  where y is like x;
    -- optionally if want a unique constraint between them, we can make that the primary key.
    -- as duplicate relationship does not make sense.
    -- If I am friends with Abhiram, there is no need to be friends with him again.
    -- a third column be some unique thing about the relationship
    -- friends with Abhiram - school friends
    -- friends with Abhiram - work friends
    CONSTRAINT table_a_table_id_pk PRIMARY KEY (table_a_id, table_b_id) -- if that's not a unique, maybe we can add another column that makes the relation unique
    -- here table_a_table_b_pk is just the name for the constraint. it can be anything but give meaningful names
    -- pk is short for primary keys.
);

-- Example

CREATE TABLE recipe_ingredient (
    recipe_id INT REFERENCES recipes (id) ON DELETE NO ACTION,
    ingredient_id INT REFERENCES ingredients (id) ON DELETE NO ACTION,
    CONSTRAINT recipe_ingredient_pk PRIMARY KEY (recipe_id, ingredient_id)
);