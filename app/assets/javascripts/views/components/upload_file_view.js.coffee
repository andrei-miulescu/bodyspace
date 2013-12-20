App.ComponentsUploadFileView = Ember.View.extend
  templateName: "components/upload_file"
  tagName: 'form'
  classNames: ['dropzone', 'col-sm-offset-2']
  attributeBindings: ['action', 'id']
  action: 'something/url'
  id: 'dropzone'

  init: ->
    Dropzone.options.dropzone =
      maxFiles: 1
      init: ->
        @on "sending", (file, xhr) ->
          $.rails.CSRFProtection(xhr)
    Dropzone.autoDiscover = false

  didInsertElement: ->
    @dropzone = new Dropzone("#" + @id)
    debugger
    @dropzone.on 'success', (file, xhr) ->
      $('#image-upload-result').attr('value', xhr.id)
