'use strict';

const parse = error => {
  let stdProps = {message: error.message, name: error.name};
  let extensions = JSON.parse(JSON.stringify(error));
  return Object.assign(stdProps, extensions);
};

Object.assign(exports, {parse});
