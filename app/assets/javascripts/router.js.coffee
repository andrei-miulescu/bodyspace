App.Router = Em.Router.extend
  enableLogging: true



App.Router.map ->
  @route "home"
  @route "timelinesShow"
  @route "postsNew"
  @route "login"
  @route "logout"
  @route "registration"



App.IndexRoute = Ember.Route.extend
  beforeModel: (transition) ->
    @transitionTo 'home'
