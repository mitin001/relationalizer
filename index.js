"use strict";

let stdin = require("./tools/stdin.js");
let rel = require("./tools/relationalize.js");
let constraint = require("./tools/constraint_satisfier.js");

let file = process.argv[2];

const outputSQL = sql => console.log(sql.join(";\n") + ";\n");

stdin.get()
  .then(data => {
    let obj = rel.relationalize(JSON.parse(data));
    constraint.satisfy(Object.assign(obj, {file}))
      .then(({sql}) => outputSQL(sql))
      .catch(({error, sql}) => {
        outputSQL(sql);
        console.error(error);
      });
  })
  .catch(error => console.error(error));
