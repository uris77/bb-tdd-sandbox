// Gruntfile.js
/* jslint node: true */
'use strict';
var path = require('path');

module.exports = function (grunt) {
    [
        'grunt-express-server'
    ].forEach(grunt.loadNpmTasks);

    grunt.initConfig({
        express: {
            sup: {
                options: {
                    script: './config/server.js'
                }
            }
        }
    });
};
