// Gruntfile.js
/* jshint node: true */
'use strict';
var path = require('path');

module.exports = function (grunt) {
    [
        'grunt-express-server',
        'grunt-contrib-handlebars',
        'grunt-contrib-clean',
        'grunt-contrib-coffee',
        'grunt-contrib-testem'
    ].forEach(grunt.loadNpmTasks);

    var
        handlebarTemplates = grunt.file.expandMapping(['src/js/templates/**/*.hbs'], 'build/js/templates/', {
            rename: function (destBase, destPath) {
                    return destPath.replace('src/js/templates', destBase).replace(/\.hbs$/, '.js');
                }
        }),

        coffeeSrc = grunt.file.expandMapping(['src/js/**/*.coffee'], 'build/js/', {
            rename: function (destBase, destPath) {
                    return destPath.replace('src/js', destBase).replace(/\.coffee$/, '.js');
                }
        });


    grunt.initConfig({
        //------------ BEGIN Expressjs -------------------
        express: {
            develop: {
                options: {
                    script: './config/server.js'
                }
            }
        },
        //------------ END Expressjs -------------------

        //------------ BEGIN Handlebars -------------------
        handlebars: {
            buildTemplates: {
                options: {
                    namespace: false,
                    amd: true,
                    commonjs: false,
                    wrapped: false
                },
                files: handlebarTemplates
            }
        },
        //------------ END Handlebars -------------------

        //------------ BEGIN CoffeeScript -------------------
        coffee: {
            build: {
                files: coffeeSrc
            }
        },
        //------------ END CoffeeScript -------------------
        
        //------------ BEGIN Testem -------------------
        testem: {
            environment: {
                src: [
                    'build/specs/main.js'
                ],
                debug: true,
                options: {
                    parallel: 8,
                    launch_in_ci: ['PhantomJS', 'Chrome'],
                    launch_in_dev: ['PhantomJS'],
                    framework: 'mocha'
                }
            }
        },
        //------------ END Testem -------------------
        
        //------------ BEGIN Clean -------------------
        clean: {
            build: ['build']
        }
        //------------ END Clean -------------------
        
    });

    //--------------- BEGIN TASKS -----------------------
    grunt.registerTask(
        'handlebars:build',
        'Build handlebars templates',
        ['handlebars:buildTemplates']
    );
    //--------------- END TASKS -------------------------
};

