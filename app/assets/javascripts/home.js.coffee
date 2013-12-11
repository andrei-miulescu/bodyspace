# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
  height = (window.innerHeight - 150)
  createStoryJS
    type: "timeline"
    width: "100%"
    height: height
    source: "/t/4.json"
    embed_id: "timeline"