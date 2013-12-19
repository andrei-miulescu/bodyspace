App.UploadFile = Ember.TextField.extend(
  type: "file"
  change: (evt) ->
    input = evt.target
    @set "_parentView.controller.image_extension", input.value.split('.')[1]
    if input.files and input.files[0]
      that = this
      reader = new FileReader()
      reader.onload = (e) ->
        data = e.target.result
        that.set "_parentView.controller.image", data

      reader.readAsDataURL input.files[0]
)