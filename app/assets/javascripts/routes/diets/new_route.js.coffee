App.DietsNewRoute = Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin,

  setupController: ->
    @controller.newRecord()

  actions:
    save: ->
      @get('store').commit()
      @transitionToAnimated 'diets.index', main: 'flip'
)