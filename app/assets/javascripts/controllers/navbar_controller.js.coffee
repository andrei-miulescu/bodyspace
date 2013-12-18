App.NavbarController = Ember.ObjectController.extend
  needs: ['sessionsNew']
  isAuthenticated: Em.computed.alias "controllers.sessionsNew.isAuthenticated"
  user: Em.computed.alias "controllers.sessionsNew.currentUser"
