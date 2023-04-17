# apart from creating databases with the CREATE DATABASE query, we can also use
# the createdb program

# database names must have alphabetic first character
# limited to 63 bytes in length
createdb database_name

# not giving an argument would default to creating a db with the user's name
createdb # is the same as calling createdb $(whoami)