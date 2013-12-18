App.RegistrationRoute = Ember.Route.extend
  model: ->
   Ember.Object.create()
  actions:
    register: ->
      Ember.$.ajax
        url: App.urls.register
        type: "POST"
        data:
        #would be nice if could do something like this
        #user: @currentModel.getJSON
        #(perhaps there is, but couldn't find)
          "user[name]": @currentModel.name
          "user[email]": @currentModel.email
          "user[password]": @currentModel.password
          "user[password_confirmation]": @currentModel.password_confirmation
        success: (data) =>
          @controllerFor('auth').set 'currentUser', data.user
          @transitionTo 'home'
        error: (jqXHR, textStatus, errorThrown) =>
          @controllerFor('registration').set "errorMsg", jqXHR.responseText
      cancel: ->
        @transitionTo 'home'