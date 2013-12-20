App.TimelineController = Ember.ObjectController.extend
  needs: ['login']
  isAuthenticated: Em.computed.alias "controllers.session.isAuthenticated"
  user: Em.computed.alias "controllers.session.currentUser"
