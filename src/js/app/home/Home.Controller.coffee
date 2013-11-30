define (require, exports, module) ->
  Marionette = require('marionette')
  HeaderView = require('app/home/header')
  TitleView = require('app/home/title')

  class HomeController extends Marionette.Controller
    initialize: (options) ->
      @repository = options.userRepository
      @region = options.region
      @layoutView = options.layoutView
      @repository.onFetched =>
        headerView = new HeaderView model: @repository.getUser()
        @layoutView.headerRegion.show headerView
      @region.show @layoutView
      @showTitleView()

    getTitleView: ->
      new TitleView()

    showTitleView: ->
      @layoutView.centerRegion.show @getTitleView()


  module.exports = HomeController

