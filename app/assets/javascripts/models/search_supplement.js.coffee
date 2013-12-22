App.SearchSupplement  = DS.Model.extend

  title: DS.attr('string')
  imageUrl: DS.attr('string')
  description: DS.attr('string')
  main_ingredient: DS.attr('string')
  rating: DS.attr('string')
  short_description: DS.attr('string')
  supported_goal: DS.attr('string')
  url: DS.attr('string')

  formattedTitle: (->
    @.get('title').substring(0, 27)
  ).property('title')