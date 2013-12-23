App.SupplementsCarouselView = Ember.View.extend
  templateName: "supplements/carousel_template"

  didInsertElement: ->
    @$(".thumbnail-noconflict").uniformHeight();
