App.ModalView = Ember.View.extend(
  didInsertElement: ->
    Ember.run.next this, ->
      @$(".modal, .modal-backdrop").addClass "in"

    $(document).on "keyup",
      _self: this
    , @esc_close
  layoutName: "modal_layout"

  esc_close: (e) ->
    if e.which is 27
      view = e.data._self
      view.$(".modal, .modal-backdrop").one "transitionend", (ev) ->
        view.controller.send "close"
      view.$(".modal").removeClass "in"

  actions:
    close: ->
      view = this
      @$(".modal, .modal-backdrop").one "transitionend", (ev) ->
        view.controller.send "close"

      @$(".modal").removeClass "in"

  willDestroyElement: ->
    $(document).off "keyup", @esc_close
)
