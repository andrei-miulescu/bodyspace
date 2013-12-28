App.DietRoute = Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin,
  actions:
    searchSupplements: (query) ->
      $.ajax(url: "/api/v1/search_supplements?q=#{query}").then (response) =>
        @controller.set('supplementResults', response.supplements)
        Ladda.stopAll()

    addToDiet: (supplement) ->
      serving = supplement.selectedServing.value
      url = supplement.url
      title = supplement.title
      imageUrl = supplement.image_url
      newRecord = App.Supplement.createRecord({title: title, urlDiet: url, imageUrl: imageUrl, serving: serving, diet: @controller.get('model')})
      @get('store').commit()

)