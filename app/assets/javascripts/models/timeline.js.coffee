App.Timeline  = DS.Model.extend

  headline: DS.attr('string')
  text: DS.attr('string')
  image: DS.attr('string')
  caption: DS.attr('string')
  thumb: DS.attr('string')

  postsCount: DS.attr('number')

  posts: DS.hasMany('App.Post')


  sortedPosts: (->
    posts = @get("posts").toArray()
    posts.sortBy (o)->
      - o.startDate
  ).property("posts.@each.isLoaded")
