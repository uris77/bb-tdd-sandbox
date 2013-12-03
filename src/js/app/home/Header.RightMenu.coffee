define (require, exports, module) ->
  Marionette = require('marionette')
  require('templates/headerRightMenu')

  class RightMenuView extends Marionette.ItemView
    className: 'section right menu'
    template: (obj) -> JST['headerRightMenu.hbs'](obj)

  module.exports = RightMenuView

