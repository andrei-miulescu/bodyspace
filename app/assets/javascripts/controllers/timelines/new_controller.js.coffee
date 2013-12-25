App.TimelinesNewController = Ember.ObjectController.extend

  newRecord: ->
    @set('content', App.Timeline.createRecord())
