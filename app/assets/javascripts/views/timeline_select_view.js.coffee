App.TimelineSelectView = Ember.Select.extend

  change: ->
    @_parentView.controller.set('timelineSelection', @selection.id)

  didInsertElement: ->
    @_parentView.controller.set('timelineSelection', @selection.id)