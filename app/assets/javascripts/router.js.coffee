App.Router = Em.Router.extend
  enableLogging: true



App.Router.map ->
  @resource 'posts', ->
    @route 'new', {path: 'new/:timeline_id'}
    @resource 'post', {path: ':post_id'}

  @resource 'timelines', ->
    @route 'new'
    @route 'show'
    @resource 'timeline', {path: ':timeline_id'}
  @route "home"
  @route "login"
  @route "logout"
  @route "registration"



App.IndexRoute = Ember.Route.extend
  beforeModel: (transition) ->
    @transitionTo 'home'
