App.DietsNewController = Ember.ObjectController.extend

  newRecord: ->
    @set('content', App.Diet.createRecord())
