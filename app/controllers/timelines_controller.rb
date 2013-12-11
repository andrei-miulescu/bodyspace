class TimelinesController < ApplicationController
  before_action :set_timeline, only: [:show, :edit, :update, :destroy]

  # GET /timelines
  # GET /timelines.json
  def index
    @timelines = Timeline.all
  end

  # GET /timelines/1
  # GET /timelines/1.json
  def show
  end

  def with_posts
    render json: timeline_with_posts
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
      params.require(:timeline).permit(:headline, :text, :type, :media, :thumbnail, :caption)
    end

    def timeline_with_posts
      timeline = Timeline.includes(:posts).find(params[:id])

      posts = timeline.posts
      assetified_posts = []
      posts.each do |post|
        assetified_posts << assetify_hash_and_camelize(post.as_json)
      end

      hash = { timeline: assetify_hash_and_camelize(timeline.as_json).merge({date: assetified_posts})}
    end

    def assetify_hash_and_camelize(hash)
      assets =  hash.slice('media', 'caption', 'thumbnail')
      hash['asset'] = camelize_hash(assets)
      ['id', 'user_id', 'created_at', 'updated_at', 'media', 'caption', 'thumbnail'].each do |k|
        hash.delete(k)
      end
      hash = format_dates(hash)
      camelize_hash(hash)
    end

    def format_dates(hash)
      sd = hash['start_date']
      ed = hash['end_date']
      hash['start_date'] = sd.strftime('%Y,%m,%d') if sd
      hash['end_date'] = ''
      hash
    end

    def camelize_hash hash
      camelHash = {}
      hash.each do |k, v|
        camelHash[k.camelize(:lower)] = v
      end
      camelHash
    end


end
