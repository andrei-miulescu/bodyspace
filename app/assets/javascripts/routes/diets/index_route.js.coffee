App.DietsIndexRoute = Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin,
  model: ->
   App.Diet.find(user_id: @get('session.currentUser').id)
)