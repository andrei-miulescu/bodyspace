App.TimelinesWidgetView = Ember.View.extend
  templateName: 'timelines/widget_template'

  myPropertyChanged: (->
      log.info 'changed'
      @rerender()
  ).observes('controllers.diet.content.posts')




#  tagName: 'div'
#  classNames: ["timeline"]
#
#  afterRender: ->
#    window.addEventListener 'resize', =>
#      @_resizeTimeline()
#
#  propertyDidChange: (->
#    @_buildTimeline()
#  ).observes('content.id')
#
#  didInsertElement: ->
#    @_buildTimeline()
#
#  willDestroy: ->
#    $('#timeline').empty()
#
#  _buildTimeline:   ->
#    id = this.content.get('id')
#    $('#timeline').empty()
#    height = (window.innerHeight - 150)
#    createStoryJS
#      type: "timeline"
#      width: "100%"
#      height: height
#      source: "/t/#{id}.json"
#      embed_id: "timeline"
#      ajax_timeout: 6000
#
#
#  _resizeTimeline: ->
#    height = (window.innerHeight - 150)
#    $('#timeline').attr("style", "width: 100%; height: #{height}px;")