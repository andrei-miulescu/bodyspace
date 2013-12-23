App.TimelinesIndexView = Ember.View.extend
  templateName: "timelines/index_template"


  didInsertElement: ->
    @$(".image-container").uniformHeight();
