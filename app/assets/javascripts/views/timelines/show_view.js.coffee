
App.TimelinesShowView = Ember.View.extend
  tagName: 'div'
  classNames: ["timeline"]
  attributeBindings: ['id']
  id: "timeline"


  didInsertElement: ->
    id = $('.timeline').attr('id')
    createStoryJS
      type: "timeline"
      width: "100%"
      height: 600
      source: "/t/3.json"
      embed_id: id
      ajax_timeout: 6000