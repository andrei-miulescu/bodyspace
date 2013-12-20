Ember.Application.initializer
  name: "authentication"
  initialize: (container, application) ->
    Ember.SimpleAuth.serverTokenEndpoint = '/oauth/token'
    Ember.SimpleAuth.setup container, application,
      serverTokenEndpoint: '/oauth/token'
