App.HomeController = Ember.ObjectController.extend
  needs: ['login']
  isAuthenticated: Em.computed.alias "controllers.login.isAuthenticated"
  user: Em.computed.alias "controllers.login.currentUser"
