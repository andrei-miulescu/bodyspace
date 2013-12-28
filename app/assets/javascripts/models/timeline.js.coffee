App.Timeline  = DS.Model.extend

  headline: DS.attr('string')
  text: DS.attr('string')
  caption: DS.attr('string')
  image: DS.attr('string')


  posts: DS.hasMany('App.Post')

  sortedPosts: (->
    posts = @get("posts").toArray()
    posts.sort((a, b) ->
        b.get("startDate") - a.get("startDate")
    )
  ).property("posts.@each.isLoaded")
