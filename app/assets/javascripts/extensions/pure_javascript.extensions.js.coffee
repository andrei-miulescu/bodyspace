(->
  sb = (f) ->
    i = @length

    while i
      o = this[--i]
      this[i] = [].concat(f.call(o, o, i), o)
    @sort (a, b) ->
      i = 0
      len = a.length

      while i < len
        return (if a[i] < b[i] then -1 else 1)  unless a[i] is b[i]
        ++i
      0

    i = @length

    while i
      this[--i] = this[i][this[i].length - 1]
    this
  if typeof Object.defineProperty is "function"
    try
      Object.defineProperty Array::, "sortBy",
        value: sb

  Array::sortBy = sb  unless Array::sortBy
)()