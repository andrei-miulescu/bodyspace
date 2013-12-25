App.WorkoutsNewRoute = Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin,

  setupController: ->
    @controller.newRecord()

  actions:
    save: ->
      @get('store').commit()
      @transitionToAnimated 'workouts.index', main: 'flip'
)