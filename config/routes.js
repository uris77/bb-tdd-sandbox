/* routes.js - module to provide routing
 */
//-------------- BEGIN MODULE SCOPE VARIABLES -----------------
/* jslint node: true */
'use strict';
var configRoutes;
var user = require(process.env.HOME + '/.hodor/config').user;
//--------------- END MODULE SCOPE VARIABLES -------------------

//---------------- BEGIN PUBLIC METHODS -----------------------

configRoutes = function (app) {
    app.get('/', function (request, response) {
        response.redirect('/index.html');
    });

    app.get('/user/:id', function (requrest, response) {
        response.contentType('json');
        response.send(user);
    });
};
module.exports = { configRoutes: configRoutes };

//---------------- END PUBLIC METHODS -------------------------
