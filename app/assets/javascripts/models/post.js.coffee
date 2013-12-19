App.Post  = DS.Model.extend

  headline: DS.attr('string')
  text: DS.attr('string')
  caption: DS.attr('number')
  image: DS.attr('string')
  timeline_id: DS.attr('string')
  image_extension: DS.attr('string')