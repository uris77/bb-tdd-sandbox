/*jshint node: true */
'use strict';
require.config({
    baseUrl: 'js',
    findNestedDependencies: true,
    name: 'Main',
    paths: {
        jquery: '../jquery/jquery',
        underscore: '../underscore/underscore',
        backbone: '../backbone/backbone',
        marionette: '../backbone.marionette/lib/backbone.marionette',
        handlebars_runtime: '../handlebars/handlebars.runtime'
    },

    shim: {
        jquery: { exports: 'jQuery' },
        underscore: { exports: '_' },
        backbone: {
            deps: ['jquery', 'underscore', 'json2'],
            exports: 'Backbone'
        },
        marionette: {
            deps: ['backbone'],
            exports: 'Marionette'
        }
    },

    packages: [
        {
            name: 'json2',
            location: '../backbone.marionette/public/javascripts',
            main: 'json2'
        },
        {
            name: 'q',
            location: '../q',
            main: 'q'
        }
    ]
});

require(['backbone', 'marionette'], function (Backbone, Marionette) {
    var aModel = new Backbone.Model({name: 'Ramones'});
    console.info("A model: ");
    console.info(aModel);
});
