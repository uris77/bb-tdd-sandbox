define (require, exports, module) ->
  Marionette = require('marionette')
  require('templates/calculateBillLayout')

  class Layout extends Marionette.Layout
    template: (obj) -> JST['calculateBillLayout.hbs'](obj)
    regions:
      'formRegion': '#form-region'
      'errors-region': '#errors-region'

  module.exports = Layout

