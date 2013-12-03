define (require, exports, module) ->
  Marionette = require('marionette')
  require('templates/calculateBillForm')

  class FormView extends Marionette.Layout
    template: (obj) -> JST['calculateBillForm.hbs'](obj)
    className: 'ui inverted form segment'

  module.exports = FormView

