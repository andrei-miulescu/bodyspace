App.TimelineRoute = Ember.Route.extend
  beforeModel: ->
    @user = @controllerFor('auth').get('currentUser')
    @transitionTo 'login' if !@user
