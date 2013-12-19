App.User  = DS.Model.extend
  timelines: DS.hasMany('timeline')

  name:   DS.attr('string')
  email:  DS.attr('string')

  timelines: DS.attr('array')
