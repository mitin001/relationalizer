'use strict';

const getRegexMatches = (regex, str) => {
  let m;
  if ((m = regex.exec(str)) !== null) return m;
}

// e.g. SQLITE_ERROR: no such table: tags
// e.g. SQLITE_ERROR: table tags has no column named encoder

const noSuchTable = str => {
  let m;
  if ((m = getRegexMatches(/no such table: (.*)/, str))) {
    return {table: m[1]};
  }
};
const noSuchColumn = str => {
  let m;
  if ((m = getRegexMatches(/table (.*?) has no column named (.*)/, str))) {
    return {table: m[1], column: m[2]};
  }
};

Object.assign(exports, {noSuchTable, noSuchColumn});
