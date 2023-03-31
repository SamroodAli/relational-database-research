-- References
-- https://sql.holt.courses/lessons/window-functions/window-functions

-- Window functions are used when we want to show aggregate functions in every single row.
-- Insites to information over multiple rows available against each row.
-- Example: Let's say we have student scores and we want to compare 
-- each student's score againt the average score of every student, 
-- window functions are useful as we can find the average of all students 
-- and have that show up as a field/column for each student.

-- Syntax

SELECT [DISTINCT] 
  other_fields, AGGREGATE_FUNCTION(aggregating_fields) 
OVER () as aggregated_field_name  -- here OVER () means all the rows from the entire table
FROM table_name
LIMIT BY some_number; -- limit and offset doesn't affect window functions

-- example

SELECT name, score, AVG(score) OVER () as average_student_score FROM students LIMIT BY 10;

-- example from https://sql.holt.courses/lessons/window-functions/window-functions
-- compare movie ratings against the average movie ratings

SELECT
  name, category, vote_average, AVG(vote_average) OVER () AS all_average
FROM
  movies
LIMIT 50;


-- if we want to partition the aggregation, we can use OVER(PARTITION BY field_name)
-- Example: let's say we have student records of the entire school and the table has the following fields:
-- name , score, batch.
-- We can now compare each student's score against ONLY THE AVERAGE OF THE BATCH rather
-- the entire school's student's average score. That is, we can partition the aggregation by batch

SELECT [DISTINCT]
  other_fields, AGGREGATE_FUNCTION(aggregating_fields)
OVER (PARTITION BY partitioning_field) as aggregated_field_name
FROM table_name
LIMIT BY some_number;

-- example

-- compare student scores of the entire school against their batch average score
SELECT name, score, batch, AVG(score) OVER (PARTITION BY batch) as average_batch_student_score FROM students LIMIT BY 10;

-- example from 

-- example from https://sql.holt.courses/lessons/window-functions/window-functions
-- compare movie rating with average rating of the movie category
SELECT
  name, category, vote_average, AVG(vote_average) OVER (PARTITION BY category) AS category_average
FROM
  movies
LIMIT 50;


-- example from https://sql.holt.courses/lessons/window-functions/window-functions
-- show average rating of each movie category
SELECT DISTINCT
  category, AVG(vote_average) OVER (PARTITION BY category) AS kind_vote_average
FROM movies;