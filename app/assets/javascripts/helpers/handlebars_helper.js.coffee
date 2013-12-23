Ember.Handlebars.registerBoundHelper "truncatepad", (str, len) ->
  if str.length > len
    new_str = str.substr(0, len + 1)
    while new_str.length
      ch = new_str.substr(-1)
      new_str = new_str.substr(0, -1)
      break  if ch is " "
    new_str = str.substr(0, len)  if new_str is ""
    return new Ember.Handlebars.SafeString(new_str + "...")
  else
    new_str = str + Array(len + 1 - str.length).join("&nbsp;");
    return new Ember.Handlebars.SafeString(new_str)
  str