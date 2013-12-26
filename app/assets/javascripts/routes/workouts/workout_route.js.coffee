App.WorkoutRoute = Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin,
  actions:
    searchExercises: (query) ->
      $.ajax(
        url: "/search_exercises?q=#{query}"
      ).then (response) =>
        @controller.set('exercisesResults', response.exercises)
        Ladda.stopAll()
    close: ->
      this.disconnectOutlet({outlet: 'modal', parentView: 'application'});

    viewExercise: (url) ->
      $.ajax(
        url: "/view_exercise?url=#{url}"
      ).then (response) =>
        @controller.set('currentExercise', response.exercise)
        @render('workouts/view_exercise_modal', { into: 'application', outlet: 'modal', view: 'modal' })
        Ladda.stopAll()
)