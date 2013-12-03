define (require, exports, module) ->
  BaseController = require('base/Controller')
  HeaderView = require('app/home/header')
  TitleView = require('app/home/title')
  MenuItems = require('app/home/MenuItems')
  HeaderController = require('app/home/Header.Controller')
  BillCalculatorController = require('app/billCalculator/BillCalculator.Controller')
  MainRouter = require('app/home/Main.Router')


  class MainController extends BaseController
    initialize: (options) ->
      super()
      @repository = options.userRepository
      @region = options.region
      @startRouter()
      @layoutView = options.layoutView
      @region.show @layoutView
      @startHeader()
      @startModule 'HOME'

    startRouter: ->
      if Backbone.history
        Backbone.history.start
          pushState: true
      @mainRouter = new MainRouter()


    getTitleView: ->
      if @titleView
        @titleView
      else
        new TitleView()

    getCurrentView: -> @_currentView

    getCurrentModule: -> @_currentModule

    showTitleView: ->
      @_currentView = @getTitleView()
      @layoutView.centerRegion.show @_currentView

    startHeader: ->
      menuItems = new MenuItems()
      headerController = new HeaderController
        region: @layoutView.headerRegion
        userRepository: @repository
        menuItems: menuItems
      headerController.vent.on 'menu:click', @startModule

    startModule: (moduleName) =>
      if @getCurrentModule() then @stopModule @_currentModule
      switch moduleName
        when 'HOME'
          @showTitleView()
          @_currentModule = {name: moduleName, module: @getTitleView()}
          @mainRouter.navigate '/'
        when 'CALCULATE_BILL'
          @_currentModule =
            name: moduleName
            module: new BillCalculatorController
              region: @layoutView.centerRegion
          @_currentView = @_currentModule.module.layout
          @mainRouter.navigate '/bill/form'

    stopModule: (module) ->
      module.module.close()
      delete module.module

    module.exports = MainController

