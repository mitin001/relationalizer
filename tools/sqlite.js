"use strict";

let errors = require("./error_parser.js");

let sqlite3, db, log;
const initialize = (file) => {
  sqlite3 = require("better-sqlite3");
  db = new sqlite3(file);
  log = [];
};
const run = ({query, bindings = []}) => new Promise((resolve, reject) => {
  try {
    let stmt = db.prepare(query);
    let scope = stmt.run(bindings);
    trace(query);
    return resolve({scope});
  }
  catch (error) {
    return reject({error: errors.parse(error)});
  }
});
const trace = query => log.push(query);
const destroy = () => {
  db.close();
  return log;
};

Object.assign(exports, {initialize, run, destroy});
