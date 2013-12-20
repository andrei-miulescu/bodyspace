App.PostsNewController = Ember.ObjectController.extend
  timelineSelection: null

  newRecord: ->
    @set('content', App.Post.createRecord({timeline_id:  @timelineSelection}))

  setRecordId: (id) ->
    @content.set('id', id)