App.Supplement  = DS.Model.extend
  diet: DS.belongsTo('App.Diet', { async: false })

  title: DS.attr('string')
  imageUrl: DS.attr('string')