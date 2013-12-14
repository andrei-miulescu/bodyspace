class DietsController < ApplicationController
  before_action :set_diet, only: [:show, :edit, :update, :destroy]

  # GET /diets
  # GET /diets.json
  def index
    @diets = Diet.all
  end

  # GET /diets/1
  # GET /diets/1.json
  def show
  end

  # GET /diets/new
  def new
    @diet = Diet.new
  end

  # GET /diets/1/edit
  def edit
  end

  # POST /diets
  # POST /diets.json
  def create
    @diet      = Diet.new(diet_params)
    @diet.user = current_user

    respond_to do |format|
      if @diet.save
        format.html { redirect_to @diet, notice: 'Diet was successfully created.' }
        format.json { render action: 'show', status: :created, location: @diet }
      else
        format.html { render action: 'new' }
        format.json { render json: @diet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diets/1
  # PATCH/PUT /diets/1.json
  def update
    respond_to do |format|
      if @diet.update(diet_params)
        format.html { redirect_to @diet, notice: 'Diet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @diet.errors, status: :unprocessable_entity }
      end
    end
  end

  def search_supplement
    q        = params[:q]
    base_url = 'http://www.bodybuilding.com'
    url      = "#{base_url}/store/catalog/search-results.jsp?q=#{q}"

    @resultHash = []

    page    = mechanize.get(url)
    results = page.parser.xpath("/html/body/div[@id='bgCon']/div[@id='mainConWithNav']/div[@id='leftContent']/div[@id='content']/div[@id='search-results-product']/div[@class='padded-content'][1]/div")

    results.each do |result_outer|
      result       = result_outer.xpath("div[@class='product-details']")
      image_url    = result_outer.xpath("div[@class='product-image']/div[@class='img']/a/img/@src").try(:text)
      info_section = result.search("div[@class='product-spec']/a")
      @resultHash << {:title             => result.at('h3').try(:text),
                      :url               => base_url + result.at('h3').at('a')['href'],
                      :image_url         => image_url,
                      :short_description => result.at('h4').try(:text),
                      :description       => result.at('p').try(:text),
                      :rating            => result.at("div[@class='med-rating']/a").try(:text),
                      :supported_goal    => info_section[0].try(:text),
                      :main_ingredient   => info_section[1].try(:text)}
    end

    render json: @resultHash
  end

  # DELETE /diets/1
  # DELETE /diets/1.json
  def destroy
    @diet.destroy
    respond_to do |format|
      format.html { redirect_to diets_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_diet
    @diet = Diet.includes(:supplements => :nutritional_items).find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def diet_params
    params.require(:diet).permit(:title, :start_date, :goal)
  end

  def mechanize
    @mechanize ||= Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
    }
  end
end
