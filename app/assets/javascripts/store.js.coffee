# http://emberjs.com/guides/models/using-the-store/

DS.RESTAdapter.map "App.Timeline",
  asset:
    embedded: "always"

DS.RESTAdapter.map "App.Post",
  asset:
    embedded: "always"

Ember.RSVP.configure "onerror", (e) ->
  if e.status == 401
    cookies = document.cookie.split('=')
    cookieNames = _.reject(cookies, (num) ->
        num % 2 is 0
    )
    for cookieName in cookieNames
      $.removeCookie(cookieName)
    App.__container__.lookup('router:main').transitionToAnimated('login', {main: 'flip'})
  else
    App.__container__.lookup('router:main').transitionToAnimated('home', {main: 'flip'})

App.Store = DS.Store.extend
  revision: 11
  adapter: DS.RESTAdapter.extend
            buildURL: (record, suffix) ->
               @_super(record, suffix) + ".json"
