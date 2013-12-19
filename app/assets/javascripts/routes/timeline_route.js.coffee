App.TimelineRoute = Ember.Route.extend
  redirect: ->
    @user = @controllerFor('auth').get('currentUser')
    @transitionTo 'login' if !@user
