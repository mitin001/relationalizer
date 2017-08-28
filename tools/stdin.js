"use strict";

const json = require("./fix_json.js");

const get = () => new Promise((resolve, reject) => {
  let data = "";
  let stdin = process.stdin;

  stdin.resume();
  stdin.setEncoding("utf8");
  stdin.on("data", chunk => {
    try {
      data += chunk;
    }
    catch (error) {
      return resolve(json.fix(data));
    }
  });
  stdin.on("end", () => resolve(data));
  stdin.on("error", error => reject(error));
});

Object.assign(exports, {get});
