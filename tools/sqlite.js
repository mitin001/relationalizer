"use strict";

let errors = require("./error_parser.js");

let sqlite3, db;
const initialize = (file) => {
  sqlite3 = require("better-sqlite3");
  db = new sqlite3(file);
};
const run = ({query, bindings = []}) => new Promise((resolve, reject) => {
  try {
    let stmt = db.prepare(query);
    let scope = stmt.run(bindings);
    return resolve({scope});
  }
  catch (error) {
    return reject({error: errors.parse(error)});
  }
});
const destroy = () => db.close();

Object.assign(exports, {initialize, run, destroy});
