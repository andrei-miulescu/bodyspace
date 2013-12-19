App.PostsNewController = Ember.ObjectController.extend
  timelineSelection: null

  newRecord: ->
    timelineId = @timelineSelection
    @set('content', App.Post.createRecord({timeline_id: timelineId}))
