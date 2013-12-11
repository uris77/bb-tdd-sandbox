( ->
  define (require, exports, module) ->
      MainController = require('app/home/Home.Controller')
      UserRepository = require('app/repositories/User.Repository')
      LayoutView = require('app/home/layout')
      MenuItems = require('app/home/MenuItems')
      sinon = require('sinon')
      require('call')
      require('stub')
      require('spy')
      require('mock')

      describe 'Main Controller', ->
        menuItems = new MenuItems
        userRepository = new UserRepository()
        region = new Marionette.Region
          el: '#content'
        layoutView = new LayoutView()
        mainController = new MainController
          userRepository: userRepository
          region: region
          layoutView: layoutView

        beforeEach ->
          @stub = sinon.stub(mainController.mainRouter, 'navigate', -> true)
        afterEach ->
          @stub.restore()

        it 'Title view is the default view', ->
          expect( mainController.getCurrentView().$el.html() )
            .match(/Welcome to Hodor/).to.be.ok

        context 'Switch Views', ->
          it "Default module is 'HOME'", ->
            expect( mainController.getCurrentModule().name ).to.be 'HOME'
          it 'current module is changed', ->
            mainController.startModule('CALCULATE_BILL')
            expect( mainController.getCurrentModule().name ).to.be 'CALCULATE_BILL'
          it 'current view is changed', ->
            expect( mainController.getCurrentView().$el.html())
              .match(/Calculate Bill Form/).to.be.ok
          it 'billable view has a form', ->
              expect( mainController.getCurrentView().$el.html() )
                .match(/Start Date/).to.be.ok
              expect( mainController.getCurrentView().$el.html() )
                .match(/End Date/).to.be.ok

        context 'Router/URL', ->
          it 'starts Backbone history', ->
              expect( Backbone.history.start.called ).to.be.ok
          it 'default url is /', ->
            mainController.startModule 'HOME'
            expect( @stub.calledWith('/') ).to.be true
          it 'url for calcuating bill form is "/bill/form"', ->
            mainController.startModule('CALCULATE_BILL')
            expect( @stub.calledWith('/bill/form') ).to.be true

        context 'TRYING WITH JQUERY EVENTS', ->
          it 'works', ->
            $("a.item:contains('#{menuItems.items.CALCULATE_BILL.get('name')}')").trigger('click')
            expect( mainController.getCurrentModule().name ).to.be 'CALCULATE_BILL'


).call(@)
