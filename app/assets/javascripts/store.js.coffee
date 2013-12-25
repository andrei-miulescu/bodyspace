# http://emberjs.com/guides/models/using-the-store/

Ember.RSVP.configure "onerror", (e) ->
  if e.status == 401
    cookies = document.cookie.split('=')
    cookieNames = _.reject(cookies, (num) ->
        num % 2 is 0
    )
    for cookieName in cookieNames
      $.removeCookie(cookieName)
    App.__container__.lookup('router:main').transitionToAnimated('login', {main: 'flip'})


App.Store = DS.Store.extend
  revision: 12
  adapter: DS.RESTAdapter.extend
            buildURL: (record, suffix) ->
               @_super(record, suffix) + ".json"
