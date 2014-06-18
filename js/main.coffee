$ ->

  masterResponse = $.ajax(
    "http://www.omdbapi.com/?s=Matrix"
    dataType: "json"
  )

  masterResponse.done (data) ->
    movies = data.Search
    for movie in movies
      imdb = movie.imdbID
      li = "<li><a href='#' data-imdbid='#{imdb}'>#{movie.Title}</a></li>"
      console.log li
      $('.movies').append(li)
    $('a').click (e) ->
      imdbID = $(@).data('imdbid')

      detailResponse = $.ajax(
        "http://www.omdbapi.com/?i=#{imdbID}&plot=full"
        dataType: "json"
      )

      detailResponse.done (data) ->
        console.log data
