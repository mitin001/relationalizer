'use strict';

let quoter = require("./sqlite_quote.js");

const getValues = ({keys, object}) => keys.map(key => object[key]);

const quote = table => quoter.singleQuote(table);
const stringifyColumns = columns => columns.map(column => quote(column)).join();
const stringifyValues = columns => columns.map(column => quote(column)).join();

// https://sqlite.org/lang_createtable.html
// https://sqlite.org/lang_altertable.html
// https://sqlite.org/lang_insert.html
const createTable = table => {
  return `CREATE TABLE ${quote(table)} (id INTEGER PRIMARY KEY AUTOINCREMENT)`;
};
const addColumn = ({table, column}) => {
  return `ALTER TABLE ${quote(table)} ADD COLUMN ${quote(column)}`;
};
const insertValues = ({table, columns, values}) => {
  columns = stringifyColumns(columns);
  values = stringifyValues(values);
  return `INSERT INTO ${quote(table)} (${columns}) VALUES (${values})`;
};
const insertDefaultValues = (table) => {
  return `INSERT INTO ${quote(table)} DEFAULT VALUES`;
};

const insert = ({table, hash}) => {
  let keys = Object.keys(hash);
  if ( ! keys.length) return insertDefaultValues(table);
  let values = getValues({keys, object: hash});
  return insertValues({table, columns: keys, values});
};

Object.assign(exports, {createTable, addColumn, insert});
