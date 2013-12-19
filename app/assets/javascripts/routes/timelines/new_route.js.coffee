App.TimelinesNewRoute = Ember.Route.extend

  setupController: ->
    @controller.newRecord()

  actions:
    save: ->
      @get('store').commit()
      @transitionTo 'timelines.show'
