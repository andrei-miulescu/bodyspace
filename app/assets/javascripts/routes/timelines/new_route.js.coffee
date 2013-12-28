App.TimelinesNewRoute = Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin,

  model: ->
    @get('store').transaction().createRecord(App.Timeline, {})

  actions:
    save: ->
      @currentModel.transaction.commit()
      @transitionToAnimated 'timelines.index', main: 'flip'
)