$(document).on 'ready page:load', ->
  height = (window.innerHeight - 150)
  createStoryJS
    type: "timeline"
    width: "100%"
    height: height
    source: "/t/1.json"
    embed_id: "timeline"