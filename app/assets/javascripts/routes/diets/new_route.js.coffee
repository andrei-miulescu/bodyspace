App.TimelinesNewRoute = Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin,

  setupController: ->
    @controller.newRecord()

  actions:
    save: ->
      @get('store').commit()
      @transitionTo 'diets.index'
)