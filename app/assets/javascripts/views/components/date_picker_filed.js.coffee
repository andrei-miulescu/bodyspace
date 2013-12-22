App.ComponentsDatePickerField =  Ember.View.extend
  tagName: 'input'
  classNames: ['datepicker']

#  templateName: 'components/datepicker'
  didInsertElement: ->
    $(@.$()).datepicker
      format: "dd/mm/yyyy",
      todayBtn: "linked",
      autoclose: true