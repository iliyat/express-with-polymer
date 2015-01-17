_ = require('underscore')

class Controller

  constructor: ()->
    @_router = require('express').Router()

  bind: (callbacks)->
    if _.isArray(callbacks)
      _.bind(callback, @) for callback in callbacks
    else
      _.bind(callbacks, @)

  _handler: (type, route, callbacks...)->
    boundCallbacks = @bind(callbacks)
    #@_router[type](config.endpoints[route] or route, boundCallbacks...)
    @_router[type](route, boundCallbacks...)

  get: (route, callbacks...)-> @_handler('get', route, callbacks...)
  post: (route, callbacks...)-> @_handler('post', route, callbacks...)
  head: (route, callbacks...)-> @_handler('head', route, callbacks...)
  put: (route, callbacks...)-> @_handler('put', route, callbacks...)
  delete: (route, callbacks...)-> @_handler('delete', route, callbacks...)
  all: (route, callbacks...)-> @_handler('all', route, callbacks...)

  index: (req, res) ->
    console.log 'get /'
    res.render('layout')

  router: ->
    @get('/', @index)

  use: (@app) ->
    @router?()
    @app.use(@_router)

module.exports = Controller