App.initApp = (currentUser) ->
  App.__container__.lookup('controller:sessionsNew').set 'currentUser', currentUser



