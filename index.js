"use strict";

let stdin = require("./tools/stdin.js");
let rel = require("./tools/relationalize.js");
let constraint = require("./tools/constraint_satisfier.js");

stdin.get()
  .then(data => {
    let obj = rel.relationalize(JSON.parse(data));
    constraint.satisfy(Object.assign(obj, {file: process.argv[2]}))
      .then(satisfied => {})
      .catch(error => console.error(error));
  })
  .catch(error => console.error(error));
