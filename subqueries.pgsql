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

-- What if we have sub queries that return multiple values instead of one ?
-- We can combine them with the Array constructor in postgresql
-- for example, a query to retrieve all star war movies and their category names ( movie_name, movie_categories) -- movie_categories is an array
SELECT
  m.name, --movie name
  ARRAY ( -- array constructor from postgresql helps construct an Array type, and from a sub query in our case here
      -- give this a set of rows
      SELECT -- fetch all category names for a movie
        ecn.name
      FROM 
        english_category_names ecn -- has all the english category names
      INNER JOIN
        movie_keywords mk -- through table between movies and category names, a movie has many category names
      ON
        mk.category_id = ecn.category_id -- connect movie and category
      WHERE
        m.id = mk.movie_id -- notice how the table alias 'm' is not defined in the sub query but accessed from the query outside
      LIMIT 5
  ) AS keywords -- list all the categories for a movie as keywords
FROM 
  movies m
WHERE 
  name ILIKE '%star wars%';

-- array in postgresql shows up in curly braces - {Mystery, Prophecy,Action,Adventures,Anime, "Space adventures"} -- double quotes when there are spaces and other such characters.