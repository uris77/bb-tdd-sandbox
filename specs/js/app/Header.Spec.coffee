( ->
  define (require, exports, module) ->
    HeaderController = require('app/home/Header.Controller')
    UserRepository = require('app/repositories/User.Repository')
    MenuItems = require('app/home/MenuItems')
    Q = require('q')
    TitleView = require('app/home/title')
    RightMenuView = require('app/home/Header.RightMenu')
    sinon = require('sinon')
    require('spy')

    describe 'Application Header', ->
      beforeEach ->
        userData =
          name: 'Roberto'
          api: 123456
        $.ajax = -> Q(userData)
        userRepository = new UserRepository()
        fakeRegion = new Marionette.Region
          el: '#region'
        @controller = new HeaderController
          region: fakeRegion
          userRepository: userRepository
          menuItems: new MenuItems()

      it 'Shows Home menu item', ->
        expect( @controller.layout.leftHeader.$el.html() )
          .match(/Home/).to.be.ok

      it 'Shows "Calculate Bill" menu item', ->
        expect( @controller.layout.leftHeader.$el.html() )
          .match(/Calculate Bill/).to.be.ok

      it 'Shows user name on right menu', ->
        @spy = sinon.spy(@controller.layout.rightHeader, 'show')
        @controller.showRightHeader()
        expect( @spy.called ).to.be true
        @spy.restore()


).call(@)
