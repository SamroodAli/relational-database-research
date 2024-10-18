# Listing indexes in a table

```sql
SELECT 
    indexname,
    indexdef 
FROM 
    pg_indexes 
WHERE 
    tablename = 'email_history';

```
