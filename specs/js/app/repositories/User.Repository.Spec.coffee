( ->
  define (require, exports, module) ->
    UserRepository = require('app/repositories/User.Repository')
    Q = require('q')
    sinon = require('sinon')
    require('call')
    require('spy')

    describe 'User Repository', ->
      it 'GET user from server', ->
        repository = new UserRepository()
        simulatedServerResponse =
            id: 1
            name: 'Roberto Guerra'
            api: 1234567
        $.ajax = -> Q(simulatedServerResponse)
        userPromise = repository.getById(1)
        userPromise.then (user) ->
          expect( user.get('id') ).to.be 1

).call(@)
