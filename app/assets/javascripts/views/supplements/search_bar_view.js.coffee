App.SupplementsSearchBarView = Ember.View.extend
  templateName: 'supplements/search_bar_template'

  submit: ->
    target = @$().find('button')[0]
    l = Ladda.create(target)
    l.start()