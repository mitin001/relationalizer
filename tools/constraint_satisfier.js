"use strict";

let sqlformat = require("./sqlformat.js");
let query = require("./query_controller.js");
let types = require("./type_classifier.js");

let rows, tables, links, unconstrainedLinks;

const getUnconstrainedLink = () => links["undefined"].shift();
const addUnconstrainedLink = link => links["undefined"].push(link);
const getTable = key => tables[key];
const getRow = key => rows[key] || {};
const getLinks = key => links[key] || [];
const linkRow = (key, column, value) => rows[key][column] = value;

const satisfyNext = (resolve, reject) => {
  let key = getUnconstrainedLink();
  if ( ! key && key !== 0) return resolve();
  let table = getTable(key);
  let hash = getRow(key);
  let links = getLinks(key);
  let insert = sqlformat.insert({table, hash});
  query.run({query: insert})
    .then(id => {
      links.forEach(linkedKey => {
        addUnconstrainedLink(linkedKey);
        linkRow(linkedKey, `${table}_id`, id);
      });
      satisfyNext(resolve, reject);
    })
    .catch(error => reject(error));
};
const satisfy = objects => new Promise((resolve, reject) => {
  // optional
  tables = objects.tables; // table names are optional
  // required
  if ( ! (rows = objects.rows)) return reject("no rows");
  if ( ! (links = objects.links)) return reject("no links");
  unconstrainedLinks = links["undefined"];
  if (types.get(unconstrainedLinks) !== types.ARRAY) {
    return reject("no unconstrained links");
  }

  query.initialize(objects.file);
  satisfyNext(
    () => resolve({sql: query.destroy()}),
    error => reject({error, sql: query.destroy()})
  );
});

Object.assign(exports, {satisfy});
