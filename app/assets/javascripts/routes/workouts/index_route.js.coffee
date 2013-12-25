App.WorkoutsIndexRoute = Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin,
  model: ->
   App.Workout.find(user_id: @get('session.currentUser').id)
)