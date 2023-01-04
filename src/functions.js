'use strict';

exports.first = (request, response) => {
  response.status(200).send('Hello World!');
};

exports.second = (event, callback) => {
  callback();
};
