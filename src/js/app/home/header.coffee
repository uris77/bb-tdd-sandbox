define ['marionette', 'templates/header'], (Marionette) ->
  class Header extends Marionette.ItemView
    className: 'ui fixed transparent inverted main menu'
    template: (obj) -> JST['header.hbs'](obj)

