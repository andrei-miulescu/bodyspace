App.PostsNewRoute = Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin,

  setupController: ->
    @controller.set('timeline', @currentModel)
    @controller.newRecord()

  actions:
    save: ->
      @controller.setRecordId($('#image-upload-result').val())
      @get('store').commit()
      @transitionToAnimated 'timeline', main: 'flip', @controller.timeline.id
)