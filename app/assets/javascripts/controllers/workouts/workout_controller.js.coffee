App.WorkoutController = Ember.ObjectController.extend
  isAuthenticated: Em.computed.alias "session.isAuthenticated"
  user: Em.computed.alias "session.currentUser"
  exercisesResults: null
  currentExercise: null

