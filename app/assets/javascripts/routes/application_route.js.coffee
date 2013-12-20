App.ApplicationRoute = Ember.Route.extend(Ember.SimpleAuth.ApplicationRouteMixin,

  loginFailed: (error) ->
   alert 'failed'


# clear the error message when the login succeeds (must call _super here to make sure an aborted
# transition is retried etc.)
  loginSucceeded: ->
    @_super()
    alert 'success'
)