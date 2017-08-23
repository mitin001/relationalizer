'use strict';

let types = require("./type_classifier.js");

// quoting keywords: https://sqlite.org/lang_keywords.html
// how to escape quotes: http://www.sqlite.org/faq.html#q14
// booleans in sqlite: https://sqlite.org/datatype3.html#boolean_datatype

const quote = ({right, left, find, replace, value}) => {
  switch(types.of(value)) {
    case types.STRING: return `${right}${value.replace(find, replace)}${left}`;
    case types.BOOLEAN: return value ? 1 : 0;
  }
  return value;
};

const singleQuote = value => quote({
  right: "'", left: "'",
  find: /'/g, replace: "''",
  value
});
const doubleQuote = value => quote({
  right: '"', left: '"',
  find: /"/g, replace: '""',
  value
});

Object.assign(exports, {singleQuote, doubleQuote});
