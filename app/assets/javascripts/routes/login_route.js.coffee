App.LoginRoute = Ember.Route.extend
  model: ->
    Ember.Object.create()
  setupController: (controller, model) ->
    controller.set 'content', model
    controller.set "errorMsg", ""
  actions:
    login: ->
      Ember.$.ajax
        url: App.urls.login
        type: "POST"
        data:
          "user[email]": @currentModel.email
          "user[password]": @currentModel.password
        success: (data) =>
          @controllerFor('auth').set 'currentUser', data.user
          @transitionTo 'home'
        error: (jqXHR, textStatus, errorThrown) =>
          if jqXHR.status==401
            @controllerFor('login').set "errorMsg", "Email or password invalid. Please try again!"
          else if jqXHR.status==406
            @controllerFor('login').set "errorMsg", "Request not acceptable (406):  make sure Devise responds to JSON."
          else
            log.info "Login Error: #{jqXHR.status} | #{errorThrown}"
