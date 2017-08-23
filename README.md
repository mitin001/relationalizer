# relationalizer
Convert JSON to SQL. For a JSON file, gets a dump of a SQL database.

## Usage
    node index.js doc.db < doc.json
    sqlite3 doc.db .dump > doc.sql

relationalizer converts a JSON file into a SQLite database file. Here we use [sqlite3](https://sqlite.org/cli.html) to convert it to an SQL file.

## Test
    npm test

The testing script creates a .db file and an .sql file for each .json file in the examples directory, and logs executed commands and errors to test.log file.

The only test that passes in the 0.1.0 release is for widget.json.

## Objectives for 0.2.0 release

For output:

- Switch from .db to .sql:
  - Stop creating an intermediate .db file
  - Stop relying on [sqlite3](https://sqlite.org/cli.html)
- Include foreign keys

For input:

- Remove restrictions on input JSON:
  - Attribute names:
    - `id` (fails tests for file.json and glossary.json)
    - `*` (fails test for list_of.json)
    - with dashes (fails test for servlet.json)
    - [SQLite keywords](https://sqlite.org/lang_keywords.html) (fails test for redirects.json)
  - Array members:
    - all scalars (fails test for john_cars.json)
    - some nulls (fails test for svg.json)

