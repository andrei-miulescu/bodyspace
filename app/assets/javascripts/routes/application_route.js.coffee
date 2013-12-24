App.ApplicationRoute = Ember.Route.extend(Ember.SimpleAuth.ApplicationRouteMixin,
  actions:
    goBack: (animation) ->
      Ember.AnimatedContainerView.enqueueAnimations main: (animation || "flip")
      history.go -1


    logout: ->
      @_super()
      $.ajax
        url: App.urls.logout
        type: "DELETE"
        dataType: "json"
        success: (data, textStatus, jqXHR) =>
          $('meta[name="csrf-token"]').attr('content', data['csrf-token'])
          $('meta[name="csrf-param"]').attr('content', data['csrf-param'])
)