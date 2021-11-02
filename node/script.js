'use strict';

const _ = require('lodash');

const foobar = 'Foo Bar';
const camelized = _.camelCase(foobar);

console.log(
    'This is JavaScript');
console.log(camelized);