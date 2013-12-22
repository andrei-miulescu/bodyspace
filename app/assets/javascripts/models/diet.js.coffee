App.Diet  = DS.Model.extend

  supplements: DS.hasMany('App.Supplement')

  title: DS.attr('string')
  goal: DS.attr('string')
  startDate: DS.attr('date')
  supplementCount: (->
    @get('supplements.content').length
  ).property('supplements.content')