App.ComponentsDatePickerField =  Em.TextField.extend
  tagName: "input"
  date: null
  attributeBindings: ['value','format','readonly','type','size']
  size:"16"
  type: "text"
  format:'dd/mm/yyyy'

  value: ( ->
    if date = @get('date')
      date
    else
      ""
  ).property('date')

  didInsertElement: ->
    fmt = @get('format')

    onChangeDate = (ev) =>
      @set 'date', ev.date

    @.$().datepicker(
      format: fmt,
      autoclose: true
    ).on('changeDate', onChangeDate)

  willDestroyElement: -> @$().datepicker('remove')

