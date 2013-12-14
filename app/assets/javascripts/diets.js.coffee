# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
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

  $(document).on 'click' , '.add-supplement-button', (e)->
    target = e.currentTarget
    l = Ladda.create(target)
    l.start()
    url = $(target).data('url')
    dietId =  $(target).data('dietId')
    $.ajax "/supplements?url_diet=#{url}&diet_id=#{dietId}",
      type: 'POST'
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) =>
        l.stop()
      success: (data, textStatus, jqXHR) =>
        l.stop()

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
                         <button class='add-supplement-button btn btn-primary ladda-button pull-right' data-style="expand-left" data-url='#{supplement.url}' data-diet-id='#{dietId}' role='button'><span class="ladda-label">Add to diet</span></button>
                      </p>
                      <div style='clear:both;'></div>
                   </div>
                  <div class='pull-left' style='position: absolute; top: 5px;'> #{supplement.rating}/10</div>
                </div>
               </div>
          """

  resultsContainer.html(html)

