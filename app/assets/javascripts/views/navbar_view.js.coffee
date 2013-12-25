App.NavbarView = Ember.View.extend

  didInsertElement: ->
    @$('.navbar-collapse .ember-view').click ->
      $('.navbar-collapse').removeClass('in').addClass('collapse').css('height', '1px')