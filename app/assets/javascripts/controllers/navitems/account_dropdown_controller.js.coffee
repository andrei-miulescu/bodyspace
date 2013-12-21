App.NavitemsAccountDropdownController = Ember.ObjectController.extend
  needs: ['login']
  isAuthenticated: Em.computed.alias "session.isAuthenticated"
  user: Em.computed.alias "session.currentUser"
