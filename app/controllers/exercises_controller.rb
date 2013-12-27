class ExercisesController < ApplicationController

  before_action :set_exercise, only: [:show, :edit, :update, :destroy]
  # GET /exercises
  # GET /exercises.json
  def index
    @exercises = Exercise.where(:user_id => params[:user_id])
  end

  # GET /exercises/1
  # GET /exercises/1.json
  def show
  end

  # GET /exercises/new
  def new
    @exercise = Exercise.new
  end

  # GET /exercises/1/edit
  def edit
  end

  # POST /exercises
  # POST /exercises.json
  def create
    @exercise      = Exercise.new(exercise_params)
    @exercise.user = current_user

    respond_to do |format|
      if @exercise.save
        format.json { render action: 'show', status: :created, location: @exercise }
      else
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercises/1
  # PATCH/PUT /exercises/1.json
  def update
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.json { head :no_content }
      else
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @exercise.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def view_exercise
    url      = params[:url]
    exercise = get_exercise_data(url)
    render json: {exercise: exercise}
  end

  private

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:name, :rating, :guide_image, :workout_id, :info_table => [], :exercise_photos => [], :guide_instructions =>[])
  end

  def get_exercise_data(url)
    page        = mechanize.get(url)
    parsed_page = page.parser
    exercise    = {}

    exercise[:name]            = parsed_page.xpath("/html/body/div[@id='bgCon']/div[@id='mainCon']/div[@id='leftContent']/div[@id='listing']/div[@id='grayBg']/div[@id='detailsCon']/div[@id='exerciseDetails']/h1").text.strip
    exercise[:rating]          = parsed_page.xpath("/html/body/div[@id='bgCon']/div[@id='mainCon']/div[@id='leftContent']/div[@id='listing']/div[@id='grayBg']/div[@id='detailsCon']/div[@id='exerciseRating']/div[@id='largeratingwidget']/div[@class='BBCOMWidget_LargeRating_Con']/div[@class='BBCOMWidget_LargeRating hreview']/span[@class='rating']").text.strip
    exercise[:exercise_photos] = parsed_page.xpath("/html/body/div[@id='bgCon']/div[@id='mainCon']/div[@id='leftContent']/div[@id='listing']/div/div[@id='Male']/div[@class='exercisePhotos']/div/a[@class='thickbox']/img/@src").collect(&:text)

    exercise[:guide_instructions] = parsed_page.xpath("/html/body/div[@id='bgCon']/div[@id='mainCon']/div[@id='leftContent']/div[@id='listing']/div/div[@class='guideContent']/ol/li").collect(&:text)
    exercise[:guide_image]        = parsed_page.xpath("/html/body/div[@id='bgCon']/div[@id='mainCon']/div[@id='leftContent']/div[@id='listing']/div/div/div[@class='guideImage']/img/@src").text


    info_table = parsed_page.xpath("/html/body/div[@id='bgCon']/div[@id='mainCon']/div[@id='leftContent']/div[@id='listing']/div[@id='grayBg']/div[@id='detailsCon']/div[@id='exerciseDetails']/p").text.gsub('  ', '').gsub(': PushYour Rating:', '').gsub(': PullYour Rating:', '').split("\n\n")
    info_table.delete_at(info_table.length - 1)
    exercise[:info_table] = info_table.collect { |a| a.gsub("\n", '') }

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
