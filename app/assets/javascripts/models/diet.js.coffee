App.Diet  = DS.Model.extend

  supplements: DS.hasMany('App.Supplement', { async: false })

  title: DS.attr('string')
  goal: DS.attr('string')
  startDate: DS.attr('date')
  supplementCount: DS.attr('number')
