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
        'grunt-contrib-testem',
        'grunt-contrib-copy'
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
        }),
        coffeeSpecs = grunt.file.expandMapping(['specs/js/app/**/*.coffee'], 'build/specs/', {
            rename: function (destBase, destPath) {
                    return destPath.replace('specs/js/app', destBase).replace(/\.coffee$/, '.js');
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
            },
            specs: {
                files: coffeeSpecs
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
        
       
        //------------ BEGIN Copy -------------------
        copy: {
            publicHtml: {
                files: [
                    {expand: false, flatten: false, filter: 'isFile', src: ['src/index.html'], dest: 'build/index.html'}
                ]
            },
            mainJs: {
                files: [
                    {expand: false, flatten: false, filter: 'isFile', src: ['src/js/Main.js'], dest: 'build/js/Main.js'}
                ]
            }
        },
        //------------ END Copy ---------------------
        
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

    grunt.registerTask(
        'run',
        'Run the application.',
        ['coffee:build']
    );

    grunt.registerTask(
        'specs',
        'Run specs',
        ['coffee', 'testem:environment']
    );
    //--------------- END TASKS -------------------------
};

