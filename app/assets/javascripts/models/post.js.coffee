App.Post  = DS.Model.extend
#  timeline: DS.belongsTo(App.Timeline)

  asset: DS.belongsTo(App.Asset)

  headline: DS.attr('string')
  text: DS.attr('string')
  startDate: DS.attr('string')
  endDate: DS.attr('string')