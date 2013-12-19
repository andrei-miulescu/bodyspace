App.TimelinesWidgetView = Ember.View.extend
  tagName: 'div'
  classNames: ["timeline"]

  afterInitialLoad: false

  afterRender: ->
    window.addEventListener 'resize', =>
      @resizeTimeline()

  myPropertyDidChange: (->
    if !@afterInitialLoad
      @afterInitialLoad = true
    else
      @buildTimeline()
  ).observes('_parentView.controller.timelineSelection')

  didInsertElement: ->
    @buildTimeline()

  buildTimeline:  ->
    id = @_parentView.controller.get('timelineSelection')
    $('#timeline').empty() if $('#timeline').html().length > 0
    height = (window.innerHeight - 150)
    createStoryJS
      type: "timeline"
      width: "100%"
      height: height
      source: "/t/#{id}.json"
      embed_id: "timeline"
      ajax_timeout: 6000


  resizeTimeline: ->
    height = (window.innerHeight - 150)
    $('#timeline').attr("style", "width: 100%; height: #{height}px;")