'use strict';

let types = require("./type_classifier.js");

// quoting keywords: https://sqlite.org/lang_keywords.html

const quote = ({right, left, find, replace, value}) => {
  if (types.of(value) === types.STRING) {
    return `${right}${value.replace(find, replace)}${left}`;
  }
  return value;
};
const msSQLQuote = value => {
  if (types.of(value) === types.STRING) {
    return `[${value.replace(/\[/g, '\\[').replace(/]/g, '\\]')}]`;
  }
  return value;
};

const singleQuote = value => quote({
  right: "'", left: "'",
  find: /'/g, replace: "\\'",
  value
});
const doubleQuote = value => quote({
  right: '"', left: '"',
  find: /"/g, replace: '\\"',
  value
});
const mySQLQuote = value => quote({
  right: '`', left: '`',
  find: /`/g, replace: '\\`',
  value
});

Object.assign(exports, {singleQuote, doubleQuote, mySQLQuote, msSQLQuote});
