App.WorkoutsAutocompleteView = Ember.View.extend
  templateName: "workouts/autocomplete_template"

  submit: ->
    target = @$().find('button')[0]
    l = Ladda.create(target)
    l.start()

  didInsertElement: ->
    $(document).on('click','.trigger-ladda', ->
      l = Ladda.create(this)
      l.start()
    )