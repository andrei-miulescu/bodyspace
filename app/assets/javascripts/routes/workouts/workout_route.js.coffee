App.WorkoutRoute = Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin,
  actions:
    searchExercises: (query) ->
      $.ajax(
        url: "/search_exercises?q=#{query}"
      ).then (response) =>
        @controller.set('exercisesResults', response.exercises)
        Ladda.stopAll()
)