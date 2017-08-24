"use strict";

const ARRAY = 0, OBJECT = 1, SCALAR = 2; // table row, database, or cell
const NUMBER = 3, STRING = 4, BOOLEAN = 5; // scalars
const SYMBOL = 6, UNDEFINED = 7, FUNCTION = 8, NULL = 9; // JS constructs

const getObjectType = (obj, fallback) => {
  if (Array.isArray(obj)) return ARRAY;
  if (obj === null) return NULL;
  return fallback;
};

// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/typeof
const of = operand => {
  switch (typeof operand) {
    case "number": return NUMBER;
    case "string": return STRING;
    case "boolean": return BOOLEAN;
    case "object": return OBJECT;
    case "undefined": return UNDEFINED;
    case "function": return FUNCTION;
    case "symbol": return SYMBOL;
  }
};
const get = obj => {
  switch(of(obj)) {
    case NUMBER:
    case STRING:
    case BOOLEAN:
      return SCALAR;
    case OBJECT:
      return getObjectType(obj, OBJECT);
  }
};

Object.assign(exports, {
  ARRAY, OBJECT, SCALAR, NUMBER, STRING, BOOLEAN, SYMBOL, UNDEFINED, FUNCTION, NULL,
  get, of
});
