App.TimelinesShowController = Ember.ObjectController.extend
  needs: ['auth']
  isAuthenticated: Em.computed.alias "controllers.auth.isAuthenticated"
  user: Em.computed.alias "controllers.auth.currentUser"
  timelines: Em.computed.alias "controllers.auth.currentUser.timelines"
  timelineSelection: null