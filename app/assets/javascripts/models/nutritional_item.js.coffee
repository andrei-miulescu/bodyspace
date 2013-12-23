App.NutritionalItem  = DS.Model.extend
  supplement: DS.belongsTo('App.Supplement')

  name: DS.attr('string')
  rdi: DS.attr('string')
  quantity: DS.attr('string')
