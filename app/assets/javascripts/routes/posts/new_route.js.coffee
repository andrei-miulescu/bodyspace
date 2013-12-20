App.PostsNewRoute = Ember.Route.extend

  setupController: ->
    @controller.set('timeline', @currentModel)
    @controller.newRecord()

  actions:
    save: ->
      @controller.setRecordId($('#image-upload-result').val())
      @get('store').commit()
      @transitionTo 'timeline', @controller.timeline.id