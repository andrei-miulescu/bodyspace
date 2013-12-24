App.Post  = DS.Model.extend

  headline: DS.attr('string')
  text: DS.attr('string')
  image: DS.attr('string')
  thumb: DS.attr('string')
  caption: DS.attr('string')
  startDate: DS.attr('date')
  endDate: DS.attr('date')

  timeline: DS.belongsTo('App.Timeline')

