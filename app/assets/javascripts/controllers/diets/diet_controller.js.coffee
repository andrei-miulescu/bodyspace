App.DietController = Ember.ObjectController.extend
  isAuthenticated: Em.computed.alias "session.isAuthenticated"
  user: Em.computed.alias "session.currentUser"
  supplementResults: null

  servings: (->
    array = []
    for i in [1..10]
     array.pushObject {value: i, title: "#{i} Servings"}
    array
  ).property('servings')
