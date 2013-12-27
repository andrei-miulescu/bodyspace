App.Exercise  = DS.Model.extend

  workout: DS.belongsTo('App.Workout')

  name: DS.attr('string')
  rating: DS.attr('string')
  exercisePhotos: DS.attr('array')
  guideInstructions: DS.attr('array')
  guideImage: DS.attr('string')
  infoTable: DS.attr('array')

  firstPhoto: (->
    @get('exercisePhotos')[0]
  ).property('exercisePhotos')