App.ApplicationRoute = Ember.Route.extend(Ember.SimpleAuth.ApplicationRouteMixin,
  actions:
    goBack: ->
      Ember.AnimatedContainerView.enqueueAnimations main: "flip"
      history.go -1
)