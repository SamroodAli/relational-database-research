# Relational Databases research including SQL

| command          | Particular                                        |
| ---------------- | ------------------------------------------------- |
| \?               | List all the backslash commands                   |
| \l               | List all the databases present                    |
| \d               | List all the database tables                      |
| \d table_name    | Describe one table ( list it's fields)            |
| \! shell command | we can run normal shell commands by prepending \! |

## Templates

There are two template databases created by default called template0 and template1

- Template0 should never be modified.

- Template1 is the template used when we create a new database.

- Modifying Template1 will update the template

- If we don't like our template, we can drop it and recreate Template1 using Template0.

- So Template0 is for us to reset our templates.

## Naming convention - use of double quotes

[Prisma article on this](https://www.prisma.io/dataguide/postgresql/short-guides/quoting-rules)
