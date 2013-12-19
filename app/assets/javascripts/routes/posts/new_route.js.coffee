App.PostsNewRoute = Ember.Route.extend
  model: ->
    Ember.Object.create()
  actions:
    newPost: (model)->
      model.save()
      @transitionTo('timelines')