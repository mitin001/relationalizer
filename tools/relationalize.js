"use strict";

let types = require("./type_classifier.js");

let id, rows, tables, links, scalars;

const increment = () => id++;
const addScalar = (id, scalar) => scalars[id] = scalar;
const addRow = (id, obj) => rows[id] = obj;
const addTable = (id, table) => tables[id] = table;
const addLink = (referenced_id, id) => {
  if (types.get(links[id]) !== types.ARRAY) links[id] = [];
  links[id].push(referenced_id);
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
      addTable(id, constraint.key);
      addLink(id, constraint.id);
      return;
    case types.SCALAR:
      id = increment();
      addScalar(id, obj);
      addTable(id, constraint.key);
      addLink(id, constraint.id);
      return;
  }
};

const relationalize = obj => {
  id = 0; rows = {}; tables = {}; links = {}; scalars = {};
  walk(obj, {});
  return {rows, tables, links, scalars};
};

Object.assign(exports, {relationalize});
