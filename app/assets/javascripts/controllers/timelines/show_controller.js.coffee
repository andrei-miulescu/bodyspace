App.TimelinesShowController = Ember.ObjectController.extend
  needs: ['auth', 'timeline']
  isAuthenticated: Em.computed.alias "controllers.auth.isAuthenticated"
  user: Em.computed.alias "controllers.auth.currentUser"
  timelineSelection: Em.computed.alias 'controllers.timeline.timelineSelection'