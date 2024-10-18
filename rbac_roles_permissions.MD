### Giving a role access

- In PostgreSQL, access control is managed through roles and privileges. 
- You can assign a user various permissions depending on what tasks they need to perform. 

For example, for giving a user access to creating databases

```sql
ALTER USER username WITH CREATEDB;
```

- Ofcourse you have to be logged in as a user who has permissions to ALTER ROLES
- Usually the `postgres` user has the complete access to everything

To start a psql session as a postgres user

```sh
sudo -u postgres psql postgres;
```

- You can skip the last postgres as psql by default connects to the database 
with the same name as the connecting user

```sh
sudo -u postgres psql
```
