App.DietView = Ember.View.extend
  templateName: "diets/diet_template"

  didInsertElement: ->
    @$('#carousel').elastislide()