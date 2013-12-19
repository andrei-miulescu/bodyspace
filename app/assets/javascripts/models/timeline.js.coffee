App.Timeline  = DS.Model.extend
  posts: DS.hasMany(App.Post)


  asset: DS.belongsTo(App.Asset)

  headline: DS.attr('string')
  text: DS.attr('string')