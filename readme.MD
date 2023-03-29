## Course notes From Frontendmasters

[Brian holt's complete intro to sql course notes](https://sql.holt.courses/)

## Order of execution in a Select Query

- FROM and JOINS
- WHERE
- GROUP BY
- HAVING
- SELECTING
- DISTINCT
- ORDER BY
- LIMIT / OFFSET

[Source: sqlbolt](https://sqlbolt.com/lesson/select_queries_order_of_execution)

## Relational Databases research including SQL

| command          | Particular                                                      |
| ---------------- | --------------------------------------------------------------- |
| \?               | List all the backslash commands                                 |
| \l               | List all the databases present                                  |
| \d               | List all the database tables                                    |
| \df              | List all the database functions                                 |
| \d table_name    | Describe one table ( list it's fields, indexes and constraints) |
| \! shell command | we can run normal shell commands by prepending \!               |

## Templates

There are two template databases created by default called template0 and template1

- Template0 should never be modified.

- Template1 is the template used when we create a new database.

- Modifying Template1 will update the template

- If we don't like our template, we can drop it and recreate Template1 using Template0.

- So Template0 is for us to reset our templates.

## Naming convention - use of quotes

- values are single quotes
- other identifiers such as table, database,columns are either no quotes or double quotes
- Without quotes, identifiers are case insensitive. Underscores are allowed but many characters such as columns and periods are not allowed
- With double quotes - Case sensitive, can use periods and colons etc but use this sparingly as we need quotes when querying

[Prisma article on this](https://www.prisma.io/dataguide/postgresql/short-guides/quoting-rules)

## Database Design process

1. What kind of thing are we storing - table
2. What properties does this thing has - fields
3. What type of data each of those properties contain - data types

## Data types

| Data types | Particular                                                               |
| ---------- | ------------------------------------------------------------------------ |
| VARCHAR    | variable length character ( Text)                                        |
| INTEGER    | Number without a decimal (-2,147,483,647 to 2,147,483,647)               |
| JSON       | JSON as plain text                                                       |
| JSONB      | Better JSON. This is JSON which is processed instead of being plain text |
| TIMESTAMP  | For date values                                                          |

## Math operations

- Preview this markdown and visit this table

| Operation           | What it does   |
| ------------------- | -------------- |
| +                   | Add            |
| -                   | Subtract       |
| \* (Check preview)  | Multiply       |
| /                   | Divide         |
| ^                   | Exponent       |
| \|/ (Check preview) | Square root    |
| @                   | Absolute value |
| %                   | Remainder      |

## Attribution

Some of the code snippets and syntax examples are from

- [Brian holt's sql course](https://sql.holt.courses/)
- [Tutorialpoint](https://www.tutorialspoint.com/postgresql)
