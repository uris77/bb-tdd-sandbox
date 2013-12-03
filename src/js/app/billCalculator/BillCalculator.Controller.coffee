define (require, exports, module) ->
  BaseController = require('base/Controller')
  Layout = require('app/billCalculator/BillCalculator.Layout')
  FormView = require('app/billCalculator/Form.View')

  class BillCalculatorController extends BaseController
    initialize: (options) ->
      super()
      @region = options.region
      @layout = new Layout()
      @formView = new FormView()
      @region.show @layout
      @layout.formRegion.show @formView

  module.exports = BillCalculatorController

