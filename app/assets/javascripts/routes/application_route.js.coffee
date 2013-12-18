App.ApplicationRoute = Ember.Route.extend
  actions:
    logout: ->
      Ember.$.ajax
        url: App.urls.logout
        type: "DELETE"
        dataType: "json"
        success: (data, textStatus, jqXHR) =>
          $('meta[name="csrf-token"]').attr('content', data['csrf-token'])
          $('meta[name="csrf-param"]').attr('content', data['csrf-param'])
          @controllerFor('auth').set 'currentUser', null
          @transitionTo 'home'
        error: (jqXHR, textStatus, errorThrown) ->
          log.info "Error logging out: #{errorThrown}"
    cancel: ->
      @transitionTo 'home'