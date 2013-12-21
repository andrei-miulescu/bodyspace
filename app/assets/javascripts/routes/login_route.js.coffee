App.LoginRoute = Ember.Route.extend(Ember.SimpleAuth.ApplicationRouteMixin,

  actions:
    loginFailed: ->
      alert 'failed'

    loginSucceeded: ->
      @_super()
)