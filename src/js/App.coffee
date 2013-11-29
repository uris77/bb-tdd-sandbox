define (require, exports, module) ->
  Marionette = require('marionette')
  HomeController = require('app/home/Home.Controller')

  App = new Marionette.Application()
  App.addRegions
    content: '#content'

  App.addInitializer ->
    new HomeController(App.content)

  module.exports = App

