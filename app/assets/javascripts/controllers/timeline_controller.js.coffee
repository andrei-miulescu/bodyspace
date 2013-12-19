App.TimelineController = Ember.ObjectController.extend
  needs: ['auth' ,'timeline']
  isAuthenticated: Em.computed.alias "controllers.auth.isAuthenticated"
  user: Em.computed.alias "controllers.auth.currentUser"
  timelines: Em.computed.alias "controllers.auth.currentUser.timelines"
  timelineSelection: null
