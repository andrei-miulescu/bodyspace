App.Supplement  = DS.Model.extend
  diet: DS.belongsTo('App.Diet')

  title: DS.attr('string')
  imageUrl: DS.attr('string')

  formattedTitle: (->
    @.get('title').substring(0, 27)
  ).property('title')