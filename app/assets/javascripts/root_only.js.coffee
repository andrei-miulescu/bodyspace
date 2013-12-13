$(document).on 'ready page:load', ->
  height = (window.innerHeight - 150)
  selectedTimeline = $('#timeline_timeline_id').val()

  createStoryJS
    type: "timeline"
    width: "100%"
    height: height
    source: "/t/#{selectedTimeline}.json"
    embed_id: "timeline"
    ajax_timeout: 6000