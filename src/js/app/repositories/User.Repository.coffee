define (require, exports, module) ->
  Q = require('q')
  Backbone = require('backbone')

  class User extends Backbone.Model
    urlRoot: '/user'

  class UserRepository
    initialize: ->
      @url = '/user'

    getById: (id) ->
      user = new User(id: id)
      Q.when(user.fetch())

  module.exports = UserRepository
