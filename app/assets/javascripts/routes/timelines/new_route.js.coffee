App.TimelinesNewRoute = Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin,

  setupController: ->
    @controller.newRecord()

  actions:
    save: ->
      @get('store').commit()
      @transitionToAnimated 'timelines.index', main: 'flip'
)