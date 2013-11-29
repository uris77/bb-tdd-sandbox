define ['jquery', 'q'], ($, Q)->
  describe 'Mocha Play', ->
    describe 'Numbers', ->
      it 'is one', ->
        one = 1
        expect(one).to.equal(1)

      it 'is true', ->
        expect(true).to.equal(true)

    describe 'Fetch Users', ->
      it 'gets user data from server', ->
        simulatedAjaxResponse =
          name: 'Roberto Guerra'
          api: 123456

        fetchUser = ->
          Q.when($.ajax({
            type: 'GET',
            url: 'http://localhost:9090/users'
          }))

        $.ajax = -> Q(simulatedAjaxResponse)

        userPromise = fetchUser()
        userPromise.then (user) ->
          expect(user).to.have.property('name', 'Roberto Guerra')

