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
  - Stop creating an intermediate .db file (DONE: optional, if `[doc.db]` is provided in `node index.js [doc.db]`)
  - Stop relying on [sqlite3](https://sqlite.org/cli.html) (DONE: an ALTER TABLE statement per each additional column)
- Include foreign keys (DONE, restriction: attribute name `parent_id` for any string replacing parent will try to reference column `parent_id` on table `parent`)

For input:

- Remove restrictions on input JSON:
  - Attribute names:
    - `id` (DONE, new restriction: attribute name pattern like `{parent:{parent_id: X}}` for any string replacing parent)
    - `*` (DONE)
    - with dashes (DONE)
    - [SQLite keywords](https://sqlite.org/lang_keywords.html) (DONE)
  - Array members:
    - all scalars (DONE, scalar rows have 3 columns: `table_id, table, parent_id` where table is the attribute name, and parent is the parent's attribute name)
    - some nulls (DONE)

