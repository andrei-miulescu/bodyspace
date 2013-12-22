App.DietRoute = Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin,
  actions:
    searchSupplements: (query) ->
      @controller.set('spinnerClass', '')
      searchSupplements = []
      $.ajax(url: "/search_supplements?q=#{query}").then (response) =>
        searchSupplements = response.supplements

        @controller.set('supplementResults', searchSupplements)
        @controller.set('spinnerClass', 'hidden')

    addToDiet: (supplement) ->
      serving = supplement.selectedServing.value
      url = supplement.url
      title = supplement.title
      imageUrl = supplement.image_url
      newRecord = {supplement: {title: title, url_diet: url, image_url: imageUrl, serving: serving, diet_id: @controller.get('model').id}}
      $.ajax(url: "/supplements", data: newRecord, method: "POST", dataType: 'json').then (response) =>
        newRecord =  App.Supplement.createRecord(response)

      @transitionTo 'home'
)