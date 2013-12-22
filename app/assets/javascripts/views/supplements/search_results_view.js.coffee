App.SupplementsSearchResultsView = Ember.View.extend
  tagName: 'div'
  classNames: ['container']
  templateName: 'supplements/search_results'

  propertyDidChange: (->
    supplementResults = @_parentView.controller.supplementResults
    return unless supplementResults && supplementResults.length > 0

    _.each supplementResults, (supplementResult) ->
      App.SupplementsSearchResultView


  ).observes('_parentView.controller.supplementResults')