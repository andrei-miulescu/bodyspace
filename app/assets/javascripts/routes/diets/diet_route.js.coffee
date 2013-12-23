App.DietRoute = Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin,
  actions:
    searchSupplements: (query) ->
      $.ajax(url: "/search_supplements?q=#{query}").then (response) =>
        @controller.set('supplementResults', response.supplements)
        Ladda.stopAll()

    addToDiet: (supplement) ->
      serving = supplement.selectedServing.value
      url = supplement.url
      title = supplement.title
      imageUrl = supplement.image_url
      newRecord = App.Supplement.createRecord({title: title, urlDiet: url, imageUrl: imageUrl, serving: serving, dietId: @controller.get('model').id})
      @get('store').commit()

      @transitionToAnimated 'diets', main: 'fade'
)

#newRecord = {supplement: {title: title, url_diet: url, image_url: imageUrl, serving: serving, diet_id: @controller.get('model').id}}
#$.ajax(url: "/supplements", data: newRecord, method: "POST", dataType: 'json').then (response) =>
#  newRecord =  App.Supplement.createRecord(response)
#
#@transitionTo 'home'