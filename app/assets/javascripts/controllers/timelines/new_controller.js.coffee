App.TimelinesNewController = Ember.ObjectController.extend

  newRecord: ->
    @set('content', App.Timeline.createRecord())

  setRecordId: (id) ->
    @content.set('id', id)