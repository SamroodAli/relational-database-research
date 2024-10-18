# Postgres Internals Research

### Where postgresql saves data
```sql
SHOW data_directory;
```
- This shows where postgresql saves data. Let's call this "data directory".
- You will find a lot of directories inside this data directory along with one directory named 'base';
- `base` directory is where postgresql saves our databases and their data
- The base directory lists each database as directories giving the database's internal identifier for the directory name


### Listing database's internal identifier

```sql
SELECT oid, datname
FROM pg_database;
```
- This will list each database along with their internal identifier, ( which maps to a 
directory in our postgresql's data directory)
- oid stands for `Object identifier`. 

### What are objects
- In PostgreSQL, the term objects refers to various entities that the database system manages and operates upon. These objects include, but are not limited to:

#### Types of Database Objects in PostgreSQL
- Databases: A PostgreSQL cluster can contain multiple databases. Each database is a separate entity that contains its own tables, indexes, and other objects.

Tables: Tables are the primary structure for storing data in a relational database. Each table consists of rows and columns.

Indexes: Indexes are special database objects that improve the speed of data retrieval operations on a table at the cost of additional space and slower writes.

Schemas: Schemas are namespaces within a database that allow you to group related objects together. They help avoid naming conflicts by allowing the same object name to exist in different schemas.

Views: Views are virtual tables created by querying one or more tables. They don’t store data themselves but present data stored in tables in a specific format.

Sequences: Sequences are special objects that generate unique numeric identifiers, often used for primary keys.

Functions and Procedures: Functions are reusable SQL code that can take arguments and return a result, while stored procedures can perform tasks without returning a value.

Triggers: Triggers are procedures that automatically execute in response to certain events on a particular table, such as inserts, updates, or deletes.

Types: User-defined types (including composite types, enums, and ranges) are used to define complex data structures within PostgreSQL.

Foreign Keys: Foreign keys establish relationships between tables by enforcing referential integrity.

Materialized Views: Materialized views are like regular views but store the result set physically, allowing for faster access at the expense of additional storage.

Rules: Rules are used to modify how PostgreSQL processes queries.

### Exploring a database in data directory
- The directory for a database in data directory contains a lot of files which represents the raw data of the database
- To figure out what each file means, we can run another query

```sql
SELECT oid, relname FROM pg_class;
```
- `relname` column shows the name of the object.
- This will list information on each of the file in the database directory. Each record shows information about one file, 
which is one object in our database.
- The objects in our database are not tables in our database. We also have objects to refer to
indices, or sequences, primary keys and a couple of other things as well
- Each of our table should also be visible in the `relname` column. 
- Each row/record/object in this table also has an internal identifier (`oid`)
- Each object is saved in the database directory as a file having the internal identifier of the object as the filename
- So for each table, there is a file with the internal identifier as filename which should include all the data in that table

### Congrats
- You now know how postgresql saves data in our hard disk

### Digging deaper

