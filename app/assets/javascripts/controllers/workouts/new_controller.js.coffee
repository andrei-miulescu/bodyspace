App.WorkoutsNewController = Ember.ObjectController.extend

  newRecord: ->
    @set('content', App.Workout.createRecord())
