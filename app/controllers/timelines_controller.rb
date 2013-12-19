class TimelinesController < ApplicationController
  before_action :set_timeline, only: [:show, :edit, :update, :destroy]

  # GET /timelines
  # GET /timelines.json
  def index
    if params[:user_id]
      @timelines = Timeline.where(:user_id => params[:user_id])
    else
      @timelines = Timeline.all
    end
  end

  # GET /timelines/1
  # GET /timelines/1.json
  def show
  end

  def with_posts
    render json: Timeline.includes(:posts).find(params[:id]).media_hash
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
    @timeline = Timeline.new(timeline_params)
    @timeline.user = current_user
    @timeline.type = 'default'

    respond_to do |format|
      if @timeline.save
        format.html { redirect_to @timeline, notice: 'Timeline was successfully created.' }
        format.json { render action: 'show', status: :created, location: @timeline }
      else
        format.html { render action: 'new' }
        format.json { render json: @timeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timelines/1
  # PATCH/PUT /timelines/1.json
  def update
    respond_to do |format|
      if @timeline.update(timeline_params)
        format.html { redirect_to @timeline, notice: 'Timeline was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @timeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timelines/1
  # DELETE /timelines/1.json
  def destroy
    @timeline.destroy
    respond_to do |format|
      format.html { redirect_to timelines_url }
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
      params.require(:timeline).permit(:headline, :text, :image, :caption, :user_id, :image_extension)
    end

end
