
App.TimelinesShowView = Ember.View.extend
  tagName: 'div'
  classNames: ["timeline"]

  afterRender: ->
    window.addEventListener 'resize', =>
      @resizeTimeline()

  didInsertElement: ->
    latestTimeline = _.last(@controller.get('user').timelines)
    height = (window.innerHeight - 150)
    createStoryJS
      type: "timeline"
      width: "100%"
      height: height
      source: "/t/#{latestTimeline}.json"
      embed_id: "timeline"
      ajax_timeout: 6000

  resizeTimeline: ->
    height = (window.innerHeight - 150)
    $('#timeline').attr("style", "width: 100%; height: #{height}px;")