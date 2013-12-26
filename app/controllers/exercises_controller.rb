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
    exercise[:exercise_photos] = parsed_page.xpath("/html/body/div[@id='bgCon']/div[@id='mainCon']/div[@id='leftContent']/div[@id='listing']/div/div[@id='Male']/div[@class='exercisePhotos']/div/a[@class='thickbox']/img/@src").collect(&:text)

    exercise[:guide_instructions] = parsed_page.xpath("/html/body/div[@id='bgCon']/div[@id='mainCon']/div[@id='leftContent']/div[@id='listing']/div/div[@class='guideContent']/ol/li").collect(&:text)
    exercise[:guide_image] = parsed_page.xpath("/html/body/div[@id='bgCon']/div[@id='mainCon']/div[@id='leftContent']/div[@id='listing']/div/div/div[@class='guideImage']/img/@src").text


    info_table = parsed_page.xpath("/html/body/div[@id='bgCon']/div[@id='mainCon']/div[@id='leftContent']/div[@id='listing']/div[@id='grayBg']/div[@id='detailsCon']/div[@id='exerciseDetails']/p").text.gsub('  ', '').gsub(': PushYour Rating:', '').gsub(': PullYour Rating:', '').split("\n\n")
    info_table.delete_at(info_table.length - 1)
    exercise[:info_table] = info_table.collect{|a| a.gsub("\n", '' )}

    #exercise[:no_alt_exercises] = parsed_page.xpath("/html/body/div[@id='bgCon']/div[@id='mainCon']/div[@id='leftContent']/div[@id='listing']/div[5]/div[@id='altExerciseCon']").text.strip

    #if exercise[:no_alt_exercises]
    #exercise[:alt_exercise1]      = parsed_page.xpath("/html/body/div[@id='bgCon']/div[@id='mainCon']/div[@id='leftContent']/div[@id='listing']/div[5]/div[@id='altExerciseCon']/div[@class='altExerciseLight']").text
    #exercise[:alt_exercise2]      = parsed_page.xpath("/html/body/div[@id='bgCon']/div[@id='mainCon']/div[@id='leftContent']/div[@id='listing']/div[5]/div[@id='altExerciseCon']/div[@class='altExercise']").text

    #end
    exercise
  end

  def mechanize
    @mechanize ||= Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
    }
  end
end
