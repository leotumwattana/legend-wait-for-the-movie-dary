$ ->

  $('#search').on 'submit', (e) ->

    e.preventDefault()

    searchTerm = $('#searchField').val()

    masterResponse = $.ajax(
      "http://www.omdbapi.com/?s=#{searchTerm}"
      dataType: "json"
    )

    masterResponse.done (data) ->

      movies = data.Search
      for movie in movies
        imdb = movie.imdbID
        li = "<li><a href='#' data-imdbid='#{imdb}'>#{movie.Title}</a></li>"
        $('.movies').append(li)

      $('a').click (e) ->
        e.preventDefault()
        imdbID = $(@).data('imdbid')

        detailResponse = $.ajax(
          "http://www.omdbapi.com/?i=#{imdbID}&plot=full"
          dataType: "json"
        )

        detailResponse.done (movie) ->
          console.log movie

          poster = "<img src='#{movie.Poster}'>"
          console.log poster

          $('.detail .title').html(movie.Title)
          $('.detail .poster').html(poster)
          $('.detail .year').html(movie.Year)
          $('.detail').append(movie.Plot)


