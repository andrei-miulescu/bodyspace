App.LoginController  = Ember.Controller.extend(Ember.SimpleAuth.LoginControllerMixin,
  currentUser: Em.computed.alias "session.currentUser"

)