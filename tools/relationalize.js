"use strict";

let types = require("./type_classifier.js");

let id, rows, tables, links;

const increment = () => id++;
const addTable = (id, table) => tables[id] = table;
const addRow = (id, obj) => rows[id] = obj;
const addScalar = (id, table, scalar) => {
  rows[id] = {};
  rows[id][table] = scalar;
};
const addLink = (referenced_id, id) => {
  if (types.get(links[id]) !== types.ARRAY) links[id] = [];
  links[id].push(referenced_id);
};
const addTableAndLink = (id, table_id, table) => {
  addTable(id, table);
  addLink(id, table_id);
};

const walk = (obj, constraint) => {
  let id;
  switch(types.get(obj)) {
    case types.ARRAY:
      return obj.map(member => walk(member, constraint));
    case types.OBJECT:
      let row = {};
      id = increment();
      Object.keys(obj).forEach(key => {
        switch(types.get(obj[key])) {
          case types.ARRAY:
          case types.OBJECT:
            return walk(obj[key], {key, id});
          case types.SCALAR:
            return row[key] = obj[key];
        }
      });
      addRow(id, row);
      addTableAndLink(id, constraint.id, constraint.key);
      return;
    case types.NULL:
      id = increment();
      addRow(id, {});
      addTableAndLink(id, constraint.id, constraint.key);
      return;
    case types.SCALAR:
      id = increment();
      addScalar(id, constraint.key, obj);
      addTableAndLink(id, constraint.id, constraint.key);
      return;
  }
};

const relationalize = obj => {
  id = 0; rows = {}; tables = {}; links = {};
  walk(obj, {});
  return {rows, tables, links};
};

Object.assign(exports, {relationalize});
