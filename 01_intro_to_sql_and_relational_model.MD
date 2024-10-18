# Intro to SQL and Relational databases
## Introduction to DBMS

Stands for database management system. Let us understand this word by word. The first word is database ?

## What is a database ?

To understand database, we first need to understand data.

What is data ? 

1. Data is information. 
2. It might be of any form. 
3. It might or might not be helpful.

What is a database ?

<aside>
💡 Database is a collection of inter-related data.

</aside>

1. A collection of inter-related data.

## What is ‘inter-related’ data ?

### Related data

1. In general, a database can contain any type of data, whether it is related or unrelated. However, databases are typically designed to store data that is related in some way, as this makes it easier to manage and retrieve the data when it is needed. For example, a database might contain customer information, with each record in the database representing a specific customer and containing information such as the customer's name, address, and phone number. In this case, the data is related because it is all about the same thing (customers).
2. In a database, data is often related through the use of keys. A key is a field or set of fields that uniquely identifies each record in a database table. For example, a customer table might have a customer ID field that serves as a primary key, meaning that every customer in the table has a unique customer ID. This allows the database to easily relate different pieces of information about the same customer by linking them to the same customer ID.

<aside>
💡 This could also extend to cardinal relations between entities such as “teacher having many students”, “teacher belonging to a class”

</aside>

### Non Related data

1. On the other hand, a database might also contain unrelated data, such as a collection of random numbers or a list of words and their definitions. In this case, the data is not necessarily related, but it can still be stored and organized in a database for easy access and manipulation.
2. data that is not related does not have any inherent connection or association. For example, a list of random numbers is not related in any meaningful way, and a database containing such a list would not have any keys or other structures to link the data together.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/435c7905-31fc-4bf2-9890-d519437a5013/Untitled.png)

## Why DBMS ? ( drawbacks of previous system )

Computers predates DBMS. Even before we had DBMS, we had to store data. Historically, we used physical files to store data. But it became hard to manage and we can see the drawbacks clearly.

We moved to using computer programs instead. Programs like excel also help us in storing and managing data.

Example: storing data in banks. 

But with a very high volume of data, it became hard to manipulate this data and we had a lot of redundancy as well. Let’s say we are keeping a record of purchases. We would do it in excel like this

| name | product name | price | quantity |
| --- | --- | --- | --- |
| Aman | computer | 1000 | 1 |
| Jacob | tablet | 400 | 2 |
| Aman T | mobile | 300 | 1 |

As you can guess, both `Aman` and `Aman T` are the same users but got different records accidentally. What we Aman cancelled his order, we might need to record this in another excel file or track own Aman’s record. This might not be an issue at the start but think of millions of transactions. 

Data is also needed by many end users such as data scientists/analysts, programmers,marketing team, product manager and company admins. All these users might have different needs and might need data in different forms. Managing all this with programs like excel would be hard, if even possible. Let’s see some disadvantages of programs like these.

## Disadvantages of file based storage systems

what are the disadvantages of file based systems

1. We would have to write a program to open, read a file, split by line, or space. Basically, reading is not easy
2. Reading and writing data at the same time is hard
3. Inconsistent relations (integrity issues, what if we have a foreign key changed but not changed in the other table ) ( different values at different place ) 
4. We also don’t have data types, instead of saving phone number, we can save the text hello, ( basically no validation of data )
5. Security, anyone who has access to the file has access to the data. also no encryption
6. You can’t have access control, limited permissions and all. you can only get basic read/write rights. no RBAC
7. No indexing, to find a record, we might have to do O(n)

This is where DBMS comes into the picture.

## So what is a DBMS ?

These are specific programs/software that help us to store data, manage data or query data.

<aside>
💡 DBMS is a  software system (application) that allows us to store, manage and query data.

</aside>

## Advantages of DBMS

1. Efficient access to data ( efficient queries and options )
2. Security and access based control
3. Handles concurrency ( transactions) 
4. Backups
5. Advanced queries

## Types of DBMS

Data is king. Based on the needs, we have different types of DBMS. Every DBMS has it’s pros and cons. There are trade-offs.

Based on the type of data or our requirements, we use the appropriate kind of DBMS, The DMBS which has properties we neeed. 

Example, for caching, Redis is popular. There are blob stores like Amazon S3 for storing files. 

Broadly, we can group these under two buckets, relational DBMS and non-relational DBMS.

## Relational vs Non Relational

Overall, DBMS are broadly grouped under two categories.

1. Relational databases ( SQL ), example: MySQL, PostgreSQL, MS-SQL.
2. No-SQL Databases, example: Redis, MongoDB

### What is a relational DBMS ?

<aside>
💡 Relational databases follow a [relational model](https://www.notion.so/Introduction-to-DBMS-and-the-Relational-Model-344ae57d10e3494bb8c233443cf65b06?pvs=21) as their data model.

</aside>

### What is a non relational DBMS ?

<aside>
💡 All DBMS that are not relational DBMS are under this group.

</aside>

## Types of No-SQL DBMS

In No-SQL, there are further subdivisions such as 

1. Document DB: MongoDB, Firebase.
2. Columnar : Cassandra
3. Graph: Neo4j
4. Key-value pairs: Redis, Dynamo DB
5. Time series.
6. Blob stores: Amazon S3

<aside>
💡 Can an event bus be considered a DBMS ? No, they can be used as databases but no as DBMS, they are really message brokers and are not meant to be used as data stores. This would be like Excel, they can be used to store data but not as powerful as DBMS.

</aside>

## Deciding between relational and non relational models

1. See if relational db works
2. if not, see why it doesn’t work and find out the reason. This can lead you to a non relational db.

## What is a data model ?

Before understanding relational data model, let’s take a step back and understand what is a data model. Often before implementing something, we plan or design it. So data models help with design or planning our data.

<aside>
💡 Data model is representation of data. Data model refers to series of `concepts` used to describe the data.

</aside>

We are talking about the way we model data here and not the actual data. We can model using relational data models or non relational data models and these are all different data models we have.

### What are these concepts ?

The concepts describe the data model. These are constraints or characteristics of the data model.The concepts describing how data is stored, structured, data relations etc.

1. One concept can be that data is in the form of a table.
2. One concept could be describing the relations, such as hierarchical, linear etc.

## What is Relational data model

Now that we know what a data model is, let us describe the relational data model and see what concepts form the relational data model.

Here, data is represented using relations, often more than one. A relation is nothing more than a table.

## Why are tables called relations ?

<aside>
💡 The term "relation" is used in this context because a table in an RDBMS is a mathematical relation, which is a set of tuples (rows) that are related to one another in some way. Each tuple in the relation represents a set of related data, and the columns of the table represent the attributes of the data.

Not so important bits:
The concept of using tables to represent relationships between data was first introduced by Edgar F. Codd, the inventor of the relational model for database management, in the 1970s. Codd's relational model revolutionized the way that databases were designed and used, and it is still the most widely used database model today.

</aside>

Let’s learn more on this.

## `Relation` in mathematics ?

In mathematics, a relation is a set of ordered pairs (also known as tuples) that represent a connection or relationship between two or more elements.

<aside>
💡 Relation is a set (collection) of tuples ( rows )

</aside>

For example, consider a set of people and a set of phone numbers. We can define a relation between these two sets by creating a set of tuples that contain a person's name and their corresponding phone number. In this case, the relation would be a set of ordered pairs such as (John, 555-1234) or (Alice, 555-4321), where the first element in the pair represents a person's name and the second element represents their phone number.

In a database, a table can be thought of as a relation in the same way. Each row in the table represents a tuple, and the columns of the table represent the attributes of the data that make up the tuple.

## Characteristics of a `Set` in mathematics

A set is a collection of values ( like set and arrays/lists), set only stores unique values and the order does not matter.

{a,b} == {b,a}

1. Set has no order
2. Set has no duplicates.

These both play a role in shaping the relational model. Let’s find out.

## Relational model concepts

1. Complete data is represented as multiple relations that are related to each other. Each relation represents a particular entity
2. `Sets` have no order. Never assume the order for both columns and rows.
3. Values in each cell is atomic (single value). No multi-valued values are allowed. No lists/arrays, No Sets, No JSONs.
4. `Sets` also only hold unique tuples. Each row is unique.

<aside>
💡 Postgres and many DMBS have added features guaranteeing order and multi-values but those are extra feature and are not part of “Relational model”. Relational model has been here for a long time and postgres and all have inherited and extended this

</aside>

## More on order of columns and rows ( `Set`'s order )

1. Whenever writing any SQL query, never assume the order. We might get rows in any particular order when you query. This is because maintaining order is expensive.
2. Never assume the order of columns as well:
    
    The order of columns in the result set is determined by the database management system (DBMS) that processes the query. Different DBMSs may have different rules for determining the order of columns in the result set. For example, some DBMSs may return the columns in the order in which they appear in the underlying table, while others may return the columns in the order in which they are listed in the SELECT clause of the query.
    
    In addition, the order of columns in the result set may be affected by other clauses of the query, such as the ORDER BY clause. This means that the order of columns in the result set may be different depending on how the query is written.
    
    Therefore, it is generally best to avoid making assumptions about the order of columns in a SQL query, and to use the ORDER BY clause if you need to specify a particular order for the result set. The same table can have columns in any order
    
    | name | product |
    | --- | --- |
    |  |  |
    
    | product  | name |
    | --- | --- |
    |  |  |

## Intro to keys ( Implementing `Set`'s uniqueness)

Each rows have to be unique but can have redundant data like customers with the same name purchasing the same product.This breaks the rule of sets of having only unique rows.To solve this, we need keys.

<aside>
💡 Keys are a set of columns whose value helps to uniquely identify a row in a table

</aside>

Only columns that guarantee unique values can be considered keys. Multi-column keys can also exist.

## Types of keys

1. Super keys
    
    Any set of columns whose values can unique identify a single row in a table
    
2. Candidate keys
    
    A set of columns of minimum size where if we move one key will cause them to be no longer considered as a key. Also no proper subset ( no same subset) of this is a super key. These are candidates to be a primary key.
    
    <aside>
    💡 A set of columns whose no subset is a super key.
    
    </aside>
    
3. Primary keys
    
    A designated set of columns to the database ( one table actually) whose values will be unique. Any one of the super key can be the primary key.
    

## Primary key

<aside>
💡 A designated set of columns whose values will be unique. Any one of the super key can be the primary key.

</aside>

In practise, it is any one of the candidate keys because candidate keys are minimum size. 

If we can’t identify a column as a key, we will create a new column to act as the key. often “id”. 

### Who will manage this id column

1. We can ask the DB to manage this (like the `AUTOINCREMENT` feature)
2. We can do it on our own ( there are `id` generators)

## Foreign keys

Relational model is not just one table and often these tables are related to each other. 

If we want to store the batch of each student, we can store the `id` column of the batch table as `batch id` in student’s table. 

<aside>
💡 A foreign key is a column or set of columns in a table that reference the primary key ( commonly ) of another table, establishing a link between the data

</aside>

In relational databases, we specify foreign keys to maintain integrity.

## Parent Child relations

In a relational database, the relationship between tables is often described as a parent-child relationship. A parent table is a table that has a primary key, and a child table is a table that has a foreign key that references the primary key of the parent table.

[The referential integrity](https://www.notion.so/Introduction-to-DBMS-and-the-Relational-Model-344ae57d10e3494bb8c233443cf65b06?pvs=21) constraint ensures that the relationship between the parent and child table is maintained, i.e. every record in the child table must have a corresponding record in the parent table.

**For example:**

Consider a database with two tables: `Customers` and `Orders`. The `Customers` table has a primary key `CustomerID` and the `Orders` table has a foreign key `CustomerID` that references the primary key of the "Customers" table.

Here, the `Customers` table is the parent table and the `Orders` table is the child table. The `Customers` table has a primary key `CustomerID` and the `Orders` table has a foreign key `CustomerID` that references the primary key of the `Customers` table. This creates a relationship between the two tables where each order is associated with a specific customer.

## Referential integrity

Referential integrity in SQL refers to the consistency that must be maintained between related tables in a database. This is achieved by using foreign keys. The rules of referential integrity ensure that:

- No orphaned records are created, i.e., a record in the child table must always have a corresponding record in the parent table.
    
    **For example:** 
    
    Consider a database with two tables: `Customers` and `Orders`. The `Customers` table has a primary key `CustomerID` and the `Orders` table has a foreign key `CustomerID` that references the primary key of the "Customers" table.
    
    The referential integrity constraint ensures that every order in the `Orders` table has a corresponding customer in the `Customers` table. If there is an order that doesn't have a corresponding customer, it would be considered an orphaned record and the database would not allow it.
    
- No duplicate records are created, i.e., a single record in the parent table can have multiple child records, but a single child record cannot have multiple parent records.

### Maintaining Referential Integrity

If we are deleting a row being referenced in another table as foreign key, we have a couple of options.

1. Not allow it.
2. Cascade it (delete associated record).
3. Set null in the associated record.
