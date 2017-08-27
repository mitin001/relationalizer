# relationalizer
Convert JSON to SQL. For a JSON file, gets a dump of a SQL database.

## Usage
    node index.js [doc.db] < doc.json > doc.sql

relationalizer converts a JSON file into a SQLite migration file. Optionally generates a SQLite database file.

## Test
    npm test

The testing script creates a .db file and an .sql file for each .json file in the examples directory, and logs executed commands and errors to test.log file.

## Restrictions

Suffix `_id` in an attribute name tells relationalizer to reference the same field from a table named with the prefix in a foreign key constraint. 
Having this attribute name in input JSON will likely cause an error and therefore an incomplete SQL migration script.

## Objectives for 0.3.0 release

For output:

- The SQL file currently has an incomplete CREATE TABLE statement and an ALTER TABLE statement per each additional column. Switch to a complete CREATE TABLE statement
- Name foreign keys (to simplify looking at entity-relationship diagrams)
- An option to suppress SQL generation, which suppresses query logging and therefore speeds up output of the SQLite database file
- The name of the main table is "undefined". Switch to the name of the file, or a value passed in as an option

For input:

- Raise size restriction to over 20 GB

For CLI mode:

- Write the usage statement and respond with it to the help option

For dependency mode:

- Enable the main file to be referenced in a require statement for use in a different module

For browser mode:

- Create a version of the module in a single JS file that can be loaded by a browser

