App.WorkoutsNewRoute = Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin,

  model: ->
    @get('store').transaction().createRecord(App.Workout, {})

  actions:
    save: ->
      @currentModel.transaction.commit()
      @transitionToAnimated 'workouts.index', main: 'flip'
)