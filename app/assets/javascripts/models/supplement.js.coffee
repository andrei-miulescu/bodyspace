App.Supplement  = DS.Model.extend
  diet: DS.belongsTo('App.Diet')

  title: DS.attr('string')
  imageUrl: DS.attr('string')
  urlDiet: DS.attr('string')
  serving: DS.attr('number')

  formattedTitle: (->
    @.get('title').substring(0, 27)
  ).property('title')