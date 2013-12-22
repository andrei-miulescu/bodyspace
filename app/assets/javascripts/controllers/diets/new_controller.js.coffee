App.TimelinesNewController = Ember.ObjectController.extend

  newRecord: ->
    @set('content', App.Diet.createRecord())
