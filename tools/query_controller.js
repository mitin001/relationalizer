'use strict';

let sqlite = require("./sqlite.js");
let sqlformat = require("./sqlformat.js");
let sqlite_errors = require("./sqlite_error_parser.js");

const initialize = ({file = "json.db"}) => sqlite.initialize(file);
const destroy = () => sqlite.destroy();

const handle = ({error, query, resolve, reject}) => {
  let matches;
  if ( ! error) return reject({error: {message: "unknown error", query}});
  if ((matches = sqlite_errors.noSuchTable(error.message))) {
    sqlite.run({query: sqlformat.createTable(matches.table)})
      .then(() => retry({query, resolve, reject}))
      .catch(({error}) => reject({error, query}));
    return;
  }
  if ((matches = sqlite_errors.noSuchColumn(error.message))) {
    sqlite.run({query: sqlformat.addColumn(matches)})
      .then(() => retry({query, resolve, reject}))
      .catch(({error}) => reject({error, query}));
    return;
  }
  reject({error, query});
};
const retry = ({query, resolve, reject}) => {
  sqlite.run({query})
    .then(({scope}) => resolve(scope.lastInsertROWID))
    .catch(({error}) => handle({error, query, resolve, reject}));
};
const run = ({query}) => {
  return new Promise((resolve, reject) => retry({query, resolve, reject}));
};

Object.assign(exports, {initialize, run, destroy});
