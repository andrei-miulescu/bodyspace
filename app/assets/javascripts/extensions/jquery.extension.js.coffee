(($) ->
  $.fn.uniformHeight = ->
    maxHeight = 0
    max = Math.max
    @each(->
      maxHeight = max(maxHeight, $(this).height())
    ).height maxHeight
) jQuery