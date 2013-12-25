class TimelinesController < ApplicationController
  before_action :set_timeline, only: [:show, :edit, :update, :destroy]
  # GET /timelines
  # GET /timelines.json
  def index
    if params[:user_id]
      @timelines = Timeline.includes(:posts).valid_timelines.where(:user_id => params[:user_id])
    else
      @timelines = Timeline.includes(:posts).valid_timelines.all
    end
  end

  # GET /timelines/1
  # GET /timelines/1.json
  def show
  end

  # GET /timelines/new
  def new
    @timeline = Timeline.new
  end

  # GET /timelines/1/edit
  def edit
  end

  # POST /timelines
  # POST /timelines.json
  def create
    @timeline = Timeline.new()
    @timeline.update_attributes(timeline_params)
    @timeline.user = current_user

    respond_to do |format|
      if @timeline.save
        format.json { render action: 'show', status: :created, location: @timeline }
      else
        format.json { render json: @timeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timelines/1
  # PATCH/PUT /timelines/1.json
  def update
    respond_to do |format|
      if @timeline.update(timeline_params)
        format.json { head :no_content }
      else
        format.json { render json: @timeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timelines/1
  # DELETE /timelines/1.json
  def destroy
    @timeline.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timeline
      @timeline = Timeline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timeline_params
      params.require(:timeline).permit(:headline, :text, :caption, :user_id, :id)
    end

end
