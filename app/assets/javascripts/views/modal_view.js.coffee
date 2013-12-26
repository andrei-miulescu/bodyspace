App.ModalView = Ember.View.extend(
  didInsertElement: ->
    Ember.run.next this, ->
      @$(".modal, .modal-backdrop").addClass "in"

  layoutName: "modal_layout"
  actions:
    close: ->
      view = this
      @$(".modal, .modal-backdrop").one "transitionend", (ev) ->
        view.controller.send "close"

      @$(".modal").removeClass "in"
)