App.DietRoute = Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin,
  actions:
    searchSupplements: (query) ->
      searchSupplements = []
      $.ajax(url: "/search_supplements?q=#{query}").then (response) =>
        _.each response.supplements, (supplement) ->
          searchSupplements.pushObject App.SearchSupplement.createRecord(supplement)

        @controller.set('supplementResults', searchSupplements)

)