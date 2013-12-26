class ExercisesController < ApplicationController

  def view_exercise
    url      = params[:url]
    exercise = get_exercise_data(url)
    render json: {exercise: exercise}
  end

  private

  def get_exercise_data(url)
    page        = mechanize.get(url)
    parsed_page = page.parser
    exercise    = {}

    exercise[:name]        = parsed_page.xpath("/html/body/div[@id='bgCon']/div[@id='mainCon']/div[@id='leftContent']/div[@id='listing']/div[@id='grayBg']/div[@id='detailsCon']/div[@id='exerciseDetails']/h1").text.strip
    exercise[:rating]      = parsed_page.xpath("/html/body/div[@id='bgCon']/div[@id='mainCon']/div[@id='leftContent']/div[@id='listing']/div[@id='grayBg']/div[@id='detailsCon']/div[@id='exerciseRating']/div[@id='largeratingwidget']/div[@class='BBCOMWidget_LargeRating_Con']/div[@class='BBCOMWidget_LargeRating hreview']/span[@class='rating']").text.strip
    exercise[:guide_image] = parsed_page.xpath("/html/body/div[@id='bgCon']/div[@id='mainCon']/div[@id='leftContent']/div[@id='listing']/div[4]/div[1]/div[@class='guideImage']/img/@src").text


    exercise[:info_table] = parsed_page.xpath("/html/body/div[@id='bgCon']/div[@id='mainCon']/div[@id='leftContent']/div[@id='listing']/div[@id='grayBg']/div[@id='detailsCon']/div[@id='exerciseDetails']/p[1]").to_html

    exercise[:exercise_photos] = parsed_page.xpath("/html/body/div[@id='bgCon']/div[@id='mainCon']/div[@id='leftContent']/div[@id='listing']/div[3]/div[@id='Male']/div[@class='exercisePhotos']").to_html


    exercise[:guide_instructions] = parsed_page.xpath("/html/body/div[@id='bgCon']/div[@id='mainCon']/div[@id='leftContent']/div[@id='listing']/div[4]/div[@class='guideContent']/ol").to_html


    #exercise[:no_alt_exercises] = parsed_page.xpath("/html/body/div[@id='bgCon']/div[@id='mainCon']/div[@id='leftContent']/div[@id='listing']/div[5]/div[@id='altExerciseCon']").text.strip

    #if exercise[:no_alt_exercises]
    exercise[:alt_exercise1]      = parsed_page.xpath("/html/body/div[@id='bgCon']/div[@id='mainCon']/div[@id='leftContent']/div[@id='listing']/div[5]/div[@id='altExerciseCon']/div[@class='altExerciseLight']").to_html
    exercise[:alt_exercise2]      = parsed_page.xpath("/html/body/div[@id='bgCon']/div[@id='mainCon']/div[@id='leftContent']/div[@id='listing']/div[5]/div[@id='altExerciseCon']/div[@class='altExercise']").to_html

    #end
    exercise
  end

  def mechanize
    @mechanize ||= Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
    }
  end
end
