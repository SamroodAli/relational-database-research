-- References
-- https://frontendmasters.com/courses/sql/transactions/

-- Transactions make queries atomic (indivisible).
-- Which means either all the queries inside the transaction succeed or none of them do

-- PostgreSQL actually treats every SQL statement as being executed within a transaction. 
-- If you do not issue a BEGIN command, then each individual statement has an implicit BEGIN and (if successful) COMMIT wrapped around it. 
-- A group of statements surrounded by BEGIN and COMMIT is sometimes called a transaction block.
      -- from https://www.postgresql.org/docs/current/tutorial-transactions.html:

-- Syntax

BEGIN TRANSACTION; -- this can be just BEGIN or BEGIN WORK -- notice how this is a statement  with a semi colon at the end

  -- list transaction queries

COMMIT; -- Can be COMMIT TRANSACTION OR COMMIT WORK--
--  commit a transaction - end of the transaction block -- has a semi colon at the end 
-- only when a trasaction is commited will it actually happen in the database. 
-- inside the transaction until the commit block, it would act as if the each query has happened but only when it is commited 
-- will it actually persist in the database

-- if we don't want to commit the queries we wrote, instead of commit, we can use ROLLBACK

-- Rollback

BEGIN TRANSACTION;

-- queries

ROLLBACK; -- all the queries in the transaction got thrown away

-- Example

-- from https://sql.holt.courses/lessons/transactions/transactions

BEGIN;

-- all of the transactions inside this transaction block has to succeed or fail but not partial completion (atomic).
INSERT INTO ingredients (title, type) VALUES ('whiskey', 'other');
INSERT INTO ingredients (title, type) VALUES ('simple syrup', 'other');

INSERT INTO recipes (title, body) VALUES ('old fashioned', 'mmmmmmm old fashioned');

INSERT INTO recipe_ingredients
  (recipe_id, ingredient_id)
VALUES
  (
    (SELECT recipe_id FROM recipes where title='old fashioned'),
    (SELECT id FROM ingredients where title='whiskey')
  ),
  (
    (SELECT recipe_id FROM recipes where title='old fashioned'),
    (SELECT id FROM ingredients where title='simple syrup')
  );

COMMIT;


-- In the above query, we can see sub queries. Instead of doing that, we can use
-- variables to store the results of the first two queries and use the variables
-- in place of the subqueries.
-- For this, we will need to use plpgsql.
-- we can't have transactions inside functions but we can have functions inside transactions.

BEGIN WORK;

-- do statements execute an anonymous function block
DO $$
  --  declare variables here
  -- variables don't need the var prefix. I just added them for readability
  DECLARE var_champagne_id INTEGER;
  DECLARE var_orange_juice_id INTEGER;
  DECLARE var_mimosa_id INTEGER;
  
  BEGIN -- block

      INSERT INTO ingredients (title, type) VALUES ('champage', 'other') RETURNING id INTO var_champagne_id;
      INSERT INTO ingredients (title, type) VALUES ('orange_juice', 'other') RETURNING id INTO var_orange_juice_id;

      INSERT INTO recipes (title, body) VALUES ('mimosa', 'brunch anyone?') RETURNING recipe_id INTO var_mimosa_id;

      INSERT INTO recipe_ingredients
        (recipe_id, ingredient_id) -- these two are field names
      VALUES
        (var_mimosa_id, var_champagne_id), -- these are all variable names
        (var_mimosa_id, var_orange_juice_id); -- these are all variable names

  END 
$$; -- do statement ends here

COMMIT WORK;