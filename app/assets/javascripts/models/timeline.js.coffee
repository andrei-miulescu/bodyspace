App.Timeline  = DS.Model.extend

  headline: DS.attr('string')
  text: DS.attr('string')
  image: DS.attr('string')
  caption: DS.attr('number')
  image_extension = DS.attr('string')