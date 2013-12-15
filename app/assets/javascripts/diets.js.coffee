# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
  $('#carousel').elastislide()

  $('#supplement-search-button').on 'click', ->
    q = $('#supplement-search-input').val()
    unless q
      alert('error')
    else
      $('#supplement-search-results .row').html('<div class="spinner"></div>')
      $.ajax "/sups?q=#{q}",
        type: 'GET'
        dataType: 'json'
        error: (jqXHR, textStatus, errorThrown) ->
          alert('error')
        success: (data, textStatus, jqXHR) ->
          buildHtml(data)

$('a[data-toggle="tab"]').on 'click', (e) ->
  e.preventDefault()
  $(this).tab('show')

$(document).on 'click' , '.add-supplement-button', (e)->
  target = e.currentTarget
  serving = $(target).parent().find('.servings-select').val()
  l = Ladda.create(target)
  l.start()
  url = $(target).data('url')
  title = $(target).data('title')
  dietId =  $(target).data('dietId')
  $.ajax "/supplements?url_diet=#{url}&diet_id=#{dietId}&serving=#{serving}",
    type: 'POST'
    dataType: 'json'
    error: (jqXHR, textStatus, errorThrown) =>
      l.stop()
      displayMessage("Failed to add: #{title}", 'alert-danger')
    success: (data, textStatus, jqXHR) =>
      l.stop()
      displayMessage("Added successfully: #{title}", 'alert-success')
      addSupplementToCarousel(data)
      incrementCounts(data)

incrementCounts = (data) ->
  currentCount = parseInt($('#supplement-count').text())
  currentCount += 1
  $('#supplement-count').text(currentCount)
  currentNuCount = parseInt($('#nutrition-count').text())
  currentNuCount += data.nutrition_count
  $('#nutrition-count').text(currentNuCount)

displayMessage = (message, type) ->
  html = """
    <div class="col-lg-7 pull-left alert #{type}">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    <p class="message">#{message}</p>
  </div>
  """
  el =  $('#error-add-supplement')
  el.html(html)

addSupplementToCarousel = (data)->
  html = """
        <li style="border: 1px solid rgb(221, 221, 221); border-top-left-radius: 4px; border-top-right-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; margin-left: 10px; width: 33.301886792452834%; max-width: 200px; max-height: 180px;">
          <a href="/supplements/#{data.id}">
            <img alt="Image 25754 original x 130 white" src="#{data.image_url}" style="height: 150px; width: 100px; margin: 0px 50px 30px 50px; ">
            <p style="position: absolute; bottom: 0px; margin-left: 5px; font-size: 90%;">#{truncate(data.title, 29)}</p>
          </a>
        </li>
        """
  carouselEmpty = $('#carousel').children().size() == 0
  $('#carousel').append($(html))
  if(carouselEmpty)
    $('#carousel').elastislide()
  else
    $('#carousel').elastislide('add')
buildHtml = (data) ->
  resultsContainer = $('#supplement-search-results .row')
  resultsContainer.empty()
  dietId = resultsContainer.data('dietId')
  html = ''
  _.each data, (supplement) =>
    html += """<div class='col-xs-3' style='margin-top: 40px; min-height: 300px; max-height: 300px;'>
                <div class='thumbnail'>
                  <div style='height: 150px'>
                    <img src='#{supplement.image_url}' alt='300x200'/>
                  </div>
                    <div class='caption'>
                      <h4>#{supplement.title}</h4>
            """
    goal = ''
    ingredient = ''
    goal = "Goal: #{supplement.supported_goal}" if supplement.supported_goal
    ingredient = "Ingredient: #{supplement.main_ingredient}" if supplement.main_ingredient
    html+= "<p>#{goal} <br/>
              #{ingredient}</p>"

    html+= """
                      <p>
                        <select class='servings-select form-control pull-left' style='width:50%;'><option value="1">1 Servings</option><option value="2">2 Servings</option><option value="3">3 Servings</option></select>
                        <button class='add-supplement-button btn btn-primary ladda-button pull-right' data-style="zoom-in" data-url='#{supplement.url}' data-title="#{supplement.title}" data-diet-id='#{dietId}' role='button'><span class="ladda-label">Add to diet</span></button>
                      </p>
                      <div style='clear:both;'></div>
                   </div>
                  <div class='pull-left' style='position: absolute; top: 5px;'> #{supplement.rating}/10</div>
                </div>
               </div>
          """

  resultsContainer.html(html)

truncate = (string, size) ->
  return jQuery.trim(string).substring(0, size-3).trim(this) + "...";