App.PostsNewRoute = Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin,

  model: (params) ->
    debugger
    @store.find(App.Timeline, params.timeline_id).then (parentModel) =>
      @get('store').transaction().createRecord(App.Post, {timeline: parentModel})

  actions:
    save: ->
      @currentModel.set('id', $('#image-upload-result').val())
      @currentModel.transaction.commit()
      @transitionToAnimated 'timeline', main: 'fade', @currentModel.get('timeline').id
)