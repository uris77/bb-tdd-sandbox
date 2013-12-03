define (require, exports, module) ->
  BaseController = require('base/Controller')
  RightMenuView = require('app/home/Header.RightMenu')
  MenuItemsView = require('app/home/MenuItemsView')
  HeaderLayout = require('app/home/HeaderLayout')

  class HeaderController extends BaseController
    initialize: (options) ->
      super()
      @region = options.region
      @menuItems = options.menuItems
      @repository = options.userRepository
      @layout = new HeaderLayout
      @repository.onFetched @showRightHeader 
      @region.show @layout
      @showMenuItems(@menuItems)

    showMenuItems: (menuItems) ->
      menuItemsView = new MenuItemsView
        collection: menuItems
      menuItemsView.on 'itemview:select', (childview, model) =>
        menuItems.each (it) ->
          if it.get('name') isnt model.get('name')
            it.set 'selected', false
        menuItemsView.render()
        @vent.trigger 'menu:click', menuItems.getItemKeyFor(model)

      @layout.leftHeader.show menuItemsView

    showRightHeader: =>
      rightMenuView = new RightMenuView model: @repository.getUser()
      @layout.rightHeader.show rightMenuView


  module.exports = HeaderController

