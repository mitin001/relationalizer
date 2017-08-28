"use strict";

let unbalanced, positions, str;

const push = (char, position) => {
  unbalanced.push(char);
  positions.push(position);
};
const pop = () => {
  unbalanced.pop();
  positions.pop();
};
const last = () => unbalanced[unbalanced.length - 1];

const cutAtFirstUnbalancedBrace = () => {
  if (unbalanced[0] && unbalanced[0] === "[" && unbalanced[1] && unbalanced[1] === "{") {
    str = str.substring(0, positions[1]);
  }
};
const balanceBrackets = () => { // replace trailing comma with a ]
  if (unbalanced[0] && unbalanced[0] === "[") {
    return str.replace(/,$/, "]"); // TODO: account for whitespace
  }
  return str;
};

const findUnbalancedEnclosers = (char, position) => {
  switch (last()) {
    case undefined: switch (char) {
      case "}":
      case "{":
      case "[":
      case "]":
      case '"': push(char, position); return;
      default: return;
    }
    case "{": switch (char) {
      case "}": pop(); return;
      case "{":
      case "[":
      case "]":
      case '"': push(char, position); return;
      default: return;
    }
    case "}": switch (char) {
      case "}":
      case "{":
      case "[":
      case "]":
      case '"': push(char, position); return;
      default: return;
    }
    case "[": switch (char) {
      case "]": pop(); return;
      case "}":
      case "{":
      case "[":
      case '"': push(char, position); return;
      default: return;
    }
    case "]": switch (char) {
      case "}":
      case "{":
      case "[":
      case "]":
      case '"': push(char, position); return;
      default: return;
    }
    case '"': switch (char) {
      case '"': pop(); return;
      case "\\": push(char, position); return;
      default: return;
    }
    case "\\": pop(); return;
  }
};

const fix = broken => {
  unbalanced = [];
  positions = [];
  str = broken;
  for (let i = 0; i < str.length; i++) {
    findUnbalancedEnclosers(str[i], i);
  }
  cutAtFirstUnbalancedBrace();
  return balanceBrackets();
};

Object.assign(exports, {fix});
