App.PostsNewController = Ember.ObjectController.extend
  timeline: null

  newRecord: ->
    @set('content', App.Post.createRecord({timeline_id:  @timeline.id}))

  setRecordId: (id) ->
    @content.set('id', id)