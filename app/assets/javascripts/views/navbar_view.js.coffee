App.NavbarView = Ember.View.extend

  didInsertElement: ->
    @$('.navbar-collapse .ember-view ul a').click ->
      $('.navbar-header .navbar-toggle').click()