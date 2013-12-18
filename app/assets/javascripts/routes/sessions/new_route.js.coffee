App.SessionsNewRoute = Ember.Route.extend
  model: ->
    Ember.Object.create()
  setupController: (controller, model) ->
    controller.set 'content', model
    controller.set "errorMsg", ""
  actions:
    login: ->
      Ember.$.ajax
        url: App.urls.sessionsNew
        type: "POST"
        data:
          "user[email]": @currentModel.email
          "user[password]": @currentModel.password
        success: (data) =>
          @controllerFor('sessionsNew').set 'currentUser', data.user
          @transitionTo 'home'
        error: (jqXHR, textStatus, errorThrown) =>
          if jqXHR.status==401
            @controllerFor('sessionsNew').set "errorMsg", "That email/password combo didn't work.  Please try again"
          else if jqXHR.status==406
            @controllerFor('sessionsNew').set "errorMsg", "Request not acceptable (406):  make sure Devise responds to JSON."
          else
            log.info "Login Error: #{jqXHR.status} | #{errorThrown}"
      cancel: ->
        @transitionTo 'home'