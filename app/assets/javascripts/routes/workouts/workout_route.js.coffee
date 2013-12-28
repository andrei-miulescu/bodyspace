App.WorkoutRoute = Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin,
  actions:
    searchExercises: (query) ->
      $.ajax(
        url: "api/v1/search_exercises?q=#{query}"
      ).then (response) =>
        @controller.set('exercisesResults', response.exercises)
        Ladda.stopAll()
    close: ->
      this.disconnectOutlet({outlet: 'modal', parentView: 'application'});

    viewExercise: (url) ->
      $.ajax(
        url: "api/v1/view_exercise?url=#{url}"
      ).then (response) =>
        @controller.set('currentExercise', response.exercise)
        @render('workouts/view_exercise_modal', { into: 'application', outlet: 'modal', view: 'modal' })
        Ladda.stopAll()

    addExercise: (url, workout) ->
      $.ajax(
        url: "api/v1/view_exercise?url=#{url}"
      ).then (response) =>
        rawExercise = response.exercise
        exercise = App.Exercise.createRecord
                    name : rawExercise.name
                    rating: rawExercise.rating
                    exercisePhotos: rawExercise.exercise_photos
                    guideInstructions: rawExercise.guide_instructions
                    guideImage: rawExercise.guide_image
                    infoTable: rawExercise.info_table
                    workout: workout

        @get('store').commit()
        Ladda.stopAll()
)