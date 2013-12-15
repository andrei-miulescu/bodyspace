class SupplementsController < ApplicationController
  before_action :set_supplement, only: [:show, :edit, :update, :destroy]

  # GET /supplements
  # GET /supplements.json
  def index
    @supplements = Supplement.all
  end

  # GET /supplements/1
  # GET /supplements/1.json
  def show
  end

  # GET /supplements/new
  def new
    @supplement = Supplement.new
  end

  # GET /supplements/1/edit
  def edit
  end

  # POST /supplements
  # POST /supplements.json
  def create
    @supplement = create_mechanize_supplement(params[:url_diet], params[:diet_id]) if params[:url_diet]
    respond_to do |format|
      if @supplement.persisted?
        format.html { redirect_to @supplement, notice: 'Supplement was successfully created.' }
        format.json { render action: 'show', status: :created, location: @supplement }
      else
        format.html { render action: 'new' }
        format.json { render json: @supplement.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /supplements/1
  # PATCH/PUT /supplements/1.json
  def update
    respond_to do |format|
      if @supplement.update(supplement_params)
        format.html { redirect_to @supplement, notice: 'Supplement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @supplement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplements/1
  # DELETE /supplements/1.json
  def destroy
    @supplement.destroy
    respond_to do |format|
      format.html { redirect_to supplements_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_supplement
    @supplement = Supplement.includes(:nutritional_items).find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def supplement_params
    params.require(:supplement).permit(:title, :image_url, :url, :diet_id)
  end

  def create_mechanize_supplement(url, diet_id)
    page            = mechanize.get(url)
    table           = page.parser.xpath("/html/body/div[@id='bgCon']/div[@id='mainConProd']/div[@id='leftContentProd']/div[@id='right-content-prod']/div[@class='ingredient-table']/div[@class='label_frame']/div[@id='label_preview']/table[@id='label_outer_table']/tbody/tr[@id='facts_outer_line']/td[@id='facts_outer_cell']/table[@id='facts_table']/tbody/tr[@class='facts_label']")
    title           = page.parser.xpath("/html/body/div[@id='bgCon']/div[@id='mainConProd']/div[@id='leftContentProd']/div[@id='left-content-prod']/div[@class='product-overview hreview-aggregate']/div[@class='product-item-info item']/div[@class='boom-three-column product-description vat']/h1[@class='fn']").text.squish
    img_url         = page.parser.xpath("/html/body/div[@id='bgCon']/div[@id='mainConProd']/div[@id='leftContentProd']/div[@id='left-content-prod']/div[@class='product-overview hreview-aggregate']/div[@class='product-item-info item']/div[@class='boom-three-column product-image vat']/a[@class='bb-image-viewer']/img[@class='photo']/@src").text
    goal            = page.parser.xpath("/html/body/div[@id='bgCon']/div[@id='mainConProd']/div[@id='leftContentProd']/div[@id='left-content-prod']/div[@class='product-overview hreview-aggregate']/div[@class='product-item-info item']/div[@class='boom-three-column product-description vat']/p[@class='product-detail-links']/a[1]").text
    main_ingredient = page.parser.xpath("/html/body/div[@id='bgCon']/div[@id='mainConProd']/div[@id='leftContentProd']/div[@id='left-content-prod']/div[@class='product-overview hreview-aggregate']/div[@class='product-item-info item']/div[@class='boom-three-column product-description vat']/p[@class='product-detail-links']/a[2]").text
    rating          = page.parser.xpath("/html/body/div[@id='bgCon']/div[@id='mainConProd']/div[@id='leftContentProd']/div[@id='left-content-prod']/div[@class='product-overview hreview-aggregate']/div[@class='boom-three-column product-rating vat']/div[@class='rate-details-con']/div[@class='rate-con rating']/div[@class='rating-bg']/a/span[@class='value']").text
    rating          = rating.to_d if rating


    supplement                 = Supplement.new
    supplement.url             = url
    supplement.diet_id         = diet_id
    supplement.title           = title
    supplement.image_url       = img_url
    supplement.main_ingredient = main_ingredient
    supplement.supported_goal  = goal
    supplement.rating          = rating
    if supplement.save

      table.each do |row|
        name     = row.at('.label_ing') #row.xpath("td[@class='line_above seq_span label_ing']/span[@class='ing_normal seq_span label_ing']").text.strip
        name     = name.text.strip if name
        qty_unit = row.at('.label_qty') #row.xpath("td[@class='line_above seq_span label_qty']/span[@class='ing_normal seq_span label_qty']").text.strip
        if qty_unit
          qty_unit = qty_unit.text.strip
          qty_unit = qty_unit.strip.split(" ")
          qty      = qty_unit[0]
          qty      = qty.squish.gsub(',', '').gsub('*', '') if qty
          unit     = qty_unit[1]
        end
        rdi = row.at('.label_dv') #row.xpath("td[@class='line_above seq_span label_dv']/span[@class='ing_normal seq_span label_dv']").text.squish.gsub(',', '').gsub('*', '')
        if rdi
          rdi = rdi.text.squish.gsub(',', '').gsub('*', '')
          rdi = rdi.match(/(\d+)/)[1].to_d if rdi && !rdi.empty? && rdi.match(/\d+/)
        end

        unless (name.blank? && qty.blank?)
          ingredient = Ingredient.where(name: name).first_or_create

          nutritional_item               = NutritionalItem.new
          nutritional_item.ingredient_id = ingredient.id
          nutritional_item.quantity      = qty.to_d if qty
          nutritional_item.unit          = unit if unit
          nutritional_item.rdi           = rdi if rdi
          nutritional_item.supplement    = supplement
          if nutritional_item.valid?
            nutritional_item.save
          end
        end

      end
    end
    supplement
  end

  def mechanize
    @mechanize ||= Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
    }
  end
end
