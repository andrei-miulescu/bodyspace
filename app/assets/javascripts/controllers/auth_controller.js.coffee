App.AuthController = Ember.ObjectController.extend
  currentUser:  null
  isAuthenticated: Em.computed.notEmpty("currentUser.email")
