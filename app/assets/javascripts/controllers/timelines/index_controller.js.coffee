App.TimelinesIndexController = Ember.ObjectController.extend
  isAuthenticated: Em.computed.alias "session.isAuthenticated"
  user: Em.computed.alias "session.currentUser"
  timelines: null