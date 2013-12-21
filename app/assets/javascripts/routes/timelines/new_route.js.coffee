App.TimelinesNewRoute =Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin,

  setupController: ->
    @controller.newRecord()

  actions:
    save: ->
      @controller.setRecordId($('#image-upload-result').val())
      @get('store').commit()
      @transitionTo 'home'
)