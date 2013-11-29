define (require, exports, module) ->
  Marionette = require('marionette')
  HeaderView = require('app/home/header')
  LayoutView = require('app/home/layout')

  class HomeController extends Marionette.Controller
    initialize: (region) ->
      @region = region
      headerView = new HeaderView()
      layoutView = new LayoutView()
      @region.show layoutView
      layoutView.headerRegion.show headerView

  module.exports = HomeController

