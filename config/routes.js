/* routes.js - module to provide routing
 */
//-------------- BEGIN MODULE SCOPE VARIABLES -----------------
/* jslint node: true */
'use strict';
var configRoutes;
//--------------- END MODULE SCOPE VARIABLES -------------------

//---------------- BEGIN PUBLIC METHODS -----------------------

configRoutes = function (app) {
    app.get('/', function (request, response) {
        response.redirect('/index.html');
    });

    app.get('/user/:id', function (requrest, response) {
        response.contentType('json');
        response.send({
            name: 'Roberto Guerra',
            api: '2123122'
        });
    });
};
module.exports = { configRoutes: configRoutes };

//---------------- END PUBLIC METHODS -------------------------
