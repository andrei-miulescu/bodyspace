App.Diet  = DS.Model.extend

  supplements: DS.hasMany('App.Supplement')

  title: DS.attr('string')
  goal: DS.attr('string')
  startDate: DS.attr('date')

  nutritionalItemsCountForDiet: (->
    count = 0
    supplements = @get('supplements.content')
    for supplement in supplements
      count+= supplement.data?.nutritional_item_ids?.length
    count
  ).property('supplements.@each')

  supplementCount: (->
    @get('supplements.content').length
  ).property('supplements.content')