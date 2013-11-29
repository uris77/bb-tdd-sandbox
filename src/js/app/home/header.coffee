define ['marionette', 'templates/header'], (Marionette) ->
  class Header extends Marionette.ItemView
    className: 'ui inverted menu'
    template: (obj) -> JST['header.hbs'](obj)

