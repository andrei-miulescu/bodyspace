App.NavbarView = Ember.View.extend

  didInsertElement: ->
    @$('.navbar-collapse .ember-view ul a').click ->
      $(@).closest('.navbar-collapse').removeClass('in').addClass('collapse').css('height', '1px')