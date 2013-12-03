define (require, exports, module) ->
  Marionette = require('marionette')

  routerController =
    calculateBill: -> cosnsole.info 'Calculate bill here'

  class MainRouter extends Marionette.AppRouter
    controller: routerController
    appRoutes:
      'bill/form': 'calculateBill'


  module.exports = MainRouter

