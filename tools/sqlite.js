"use strict";

let errors = require("./error_parser.js");

let sqlite3, db;
const initialize = (file) => {
  sqlite3 = require("sqlite3").verbose();
  db = new sqlite3.Database(file);
};
const run = ({query, bindings = []}) => new Promise((resolve, reject) => {
  db.run(query, bindings, function(error) {
    let scope = this;
    if (error) return reject({error: errors.parse(error), scope});
    return resolve({scope});
  });
});
const destroy = () => db.close();

Object.assign(exports, {initialize, run, destroy});
