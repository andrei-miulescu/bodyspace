App.PostsNewRoute = Ember.Route.extend

  setupController: ->
    @controller.set 'timelineSelection', (@controllerFor('timelines.show').get('timelineSelection') || _.first(@controllerFor('auth').get('currentUser').timelines).id)
    @controller.newRecord()

  actions:
    save: ->
      @controller.setRecordId($('#image-upload-result').val())
      @get('store').commit()
      @transitionTo 'timelines.show'
