App.TimelinesIndexRoute = Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin,
  model: ->
   App.Timeline.find(user_id: @get('session.currentUser').id)
)