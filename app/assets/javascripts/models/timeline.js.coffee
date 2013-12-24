App.Timeline  = DS.Model.extend

  headline: DS.attr('string')
  text: DS.attr('string')
  image: DS.attr('string')
  caption: DS.attr('string')
  thumb: DS.attr('string')

  postsCount: DS.attr('number')

  posts: DS.hasMany('App.Post', {async: true})


  postsByMonth: (->
    posts = @get('posts').content
    posts = posts.sortBy (o)->
               - o.start_date
    results = []
    resultsHash = {}
    index = 0
    for post in posts
      monthYear = moment(post.startDate).format('MMM-YY')

      resultsHash[monthYear] ||= []
      post.data.startDate = moment(post.data.start_date).format('DD MMM YYYY')
      if index % 2 == 0
        post.data.clearBoth = false
        post.data.uiSide = 'column column_left'
      else
        post.data.uiSide ='column column_right'
        post.data.clearBoth = true
      resultsHash[monthYear].pushObject(post.data)
      index += 1

    results = for monthYear, posts of resultsHash
                {month: monthYear, groupedPosts: posts}

    results
  ).property('posts')