-- References
-- https://sql.holt.courses/lessons/subqueries/how-to-subquery
-- https://www.navicat.com/en/company/aboutus/blog/1704-joins-versus-subqueries-which-is-faster
-- Sub queries are queries inside other queries

-- example from https://sql.holt.courses/lessons/subqueries/how-to-subquery

SELECT
  p.name
FROM
  casts c

INNER JOIN
  people p
ON
  c.person_id = p.id

WHERE
  c.movie_id = ( 
    SELECT -- this is a sub query
      id
    FROM
      movies
    WHERE
      name = 'Tron Legacy' -- if there is no index on the 'name' field, this can be expensive
  );


-- Sub queries are almost always slower than joins. So joins are preferred over sub-queries.
-- Sub queries are often more readable, if performance is not an issue, we can use sub queries,
-- but joins are recommended for most cases