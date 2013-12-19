App.Post  = DS.Model.extend

  asset: DS.belongsTo(App.Asset)

  headline: DS.attr('string')
  text: DS.attr('string')
