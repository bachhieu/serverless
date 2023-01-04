'use strict';

// nest
// module.exports = {
//   ...require('./src/functions')
// }

// default
exports.http = (request, response) => {
  response.status(200).send('Hello World!');
};

exports.event = (event, callback) => {
  callback();
};
