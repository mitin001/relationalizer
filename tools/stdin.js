"use strict";

const get = () => new Promise((resolve, reject) => {
  let stdin = process.stdin, chunks = [];
  stdin.resume();
  stdin.setEncoding('utf8');
  stdin.on('data', chunk => chunks.push(chunk));
  stdin.on('end', () => resolve(chunks.join('')));
  stdin.on('error', error => reject(error));
});

Object.assign(exports, {get});
