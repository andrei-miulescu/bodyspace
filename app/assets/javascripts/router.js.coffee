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

  @resource 'diets', ->
    @route 'new'
    @resource 'diet', {path: ':diet_id'}

  @resource 'supplements', ->
    @route 'new'
    @resource 'supplement', {path: ':supplement_id'}

  @resource 'workouts', ->
    @route 'new'
    @resource 'workout', {path: ':workout_id'}

  @resource 'exercises', ->
    @route 'new'
    @resource 'exercise', {path: ':exercise_id'}

  @route "home"
  @route "login"
  @route "logout"
  @route "registration"



App.IndexRoute = Ember.Route.extend
  beforeModel: (transition) ->
    @transitionToAnimated 'home', main: 'flip'
