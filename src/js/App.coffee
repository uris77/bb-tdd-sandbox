define (require, exports, module) ->
  Marionette = require('marionette')
  HomeController = require('app/home/Home.Controller')
  UserRepository = require('app/repositories/User.Repository')
  LayoutView = require('app/home/layout')

  App = new Marionette.Application()
  userRepository = new UserRepository()
  App.addRegions
    content: '#content'

  App.addInitializer (args={userRepository: userRepository}) ->
    layoutView = new LayoutView()
    new HomeController
      region: App.content
      userRepository: args.userRepository
      layoutView: layoutView
    args.userRepository.getById(1).done()

  module.exports = App

