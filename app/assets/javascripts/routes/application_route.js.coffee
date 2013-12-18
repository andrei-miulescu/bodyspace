App.ApplicationRoute = Ember.Route.extend
  actions:
    logout: ->
      Ember.$.ajax
        url: App.urls.sessionDestroy
#        beforeSend: (xhr) ->
#          xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
        type: "DELETE"
        dataType: "json"
        success: (data, textStatus, jqXHR) =>
          $('meta[name="csrf-token"]').attr('content', data['csrf-token'])
          $('meta[name="csrf-param"]').attr('content', data['csrf-param'])
          @controllerFor('sessionsNew').set 'currentUser', null
          @transitionTo 'home'
        error: (jqXHR, textStatus, errorThrown) ->
          log.info "Error logging out: #{errorThrown}"