App.Supplement  = DS.Model.extend
  diet: DS.belongsTo('App.Diet')

  title: DS.attr('string')
  imageUrl: DS.attr('string')