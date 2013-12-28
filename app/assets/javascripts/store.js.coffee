# http://emberjs.com/guides/models/using-the-store/

App.logoutAndRedirect = ->
  cookies = document.cookie.split('=')
  cookieNames = _.reject(cookies, (num) ->
    num % 2 is 0
  )
  for cookieName in cookieNames
    $.removeCookie(cookieName)
  transition = App.__container__.lookup('router:main').router.activeTransition
  App.__container__.lookup('controller:application').set('session.attemptedTransition', transition);
  if Ember.canInvoke(transition, "send")
    transition.send "login"
  else
    App.__container__.lookup('router:main').transitionToAnimated('login', {main: 'flip'})

Ember.RSVP.configure "onerror", (e) ->
  if e.status == 401
    App.logoutAndRedirect()
  else
    App.__container__.lookup('router:main').transitionToAnimated('error', {main: 'flip'})

App.ApplicationAdapter = DS.RESTAdapter.extend
  namespace: 'api/v1'
  buildURL: (record, suffix) ->
    @_super(record, suffix) + ".json"

App.Store = DS.Store.extend
  revision: 12
  adapter: App.ApplicationAdapter

DS.JSONTransforms.array =
  serialize: (jsonData)->
    if Em.typeOf(jsonData) is 'array' then jsonData else []

  deserialize: (externalData)->
    switch Em.typeOf(externalData)
      when 'array'  then return externalData
      when 'string' then return externalData.split(',').map((item)-> jQuery.trim(item))
      else               return []