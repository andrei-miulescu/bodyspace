App.PostsNewController = Ember.ObjectController.extend
  timeline: null

  newRecord: ->
    @set('content', App.Post.createRecord({timeline:  @timeline}))

  setRecordId: (id) ->
    @content.set('id', id)