'use strict';

let quote = require("./quote.js");

const getValues = ({keys, object}) => keys.map(key => object[key]);
const stringifyTable = table => quote.singleQuote(table);
const stringifyColumns = columns => `${columns.map(column => quote.singleQuote(column)).join()}`;
const stringifyValues = columns => `${columns.map(column => quote.doubleQuote(column)).join()}`;

// https://sqlite.org/lang_createtable.html
// https://sqlite.org/lang_altertable.html
// https://sqlite.org/lang_insert.html
const createTable = table => {
  return `CREATE TABLE ${stringifyTable(table)} (id INTEGER PRIMARY KEY AUTOINCREMENT)`;
};
const addColumn = ({table, column}) => {
  return `ALTER TABLE ${stringifyTable(table)} ADD COLUMN ${column}`;
};
const insertValues = ({table, columns, expressions}) => {
  return `INSERT INTO ${stringifyTable(table)} (${columns}) VALUES (${expressions})`;
};
const insertDefaultValues = (table) => {
  return `INSERT INTO ${stringifyTable(table)} DEFAULT VALUES`;
};

const insert = ({table, hash}) => {
  let keys = Object.keys(hash);
  if ( ! keys.length) return insertDefaultValues(table);
  let values = getValues({keys, object: hash});
  let columns = stringifyColumns(keys);
  let expressions = stringifyValues(values);
  return insertValues({table, columns, expressions});
};

Object.assign(exports, {createTable, addColumn, insert});
