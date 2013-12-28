module Api
  module V1
    class DietsController < ApiController
      before_action :set_diet, only: [:show, :edit, :update, :destroy]
      # GET /diets
      # GET /diets.json
      def index
        @diets = Diet.includes(:supplements).where(:user_id => params[:user_id])
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
            format.json { render action: 'show', status: :created, location: [:api, :v1, @diet] }
          else
            format.json { render json: @diet.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /diets/1
      # PATCH/PUT /diets/1.json
      def update
        respond_to do |format|
          if @diet.update(diet_params)
            format.json { head :no_content }
          else
            format.json { render json: @diet.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /diets/1
      # DELETE /diets/1.json
      def destroy
        @diet.destroy
        respond_to do |format|
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

      def set_nutritional_info
        @nutritional_info ||= {}
        @diet.supplements.map do |supplement|
          supplement.nutritional_items.map do |nutritional_item|
            key = nutritional_item.ingredient.name.titleize
            if nutritional_item.quantity
              @nutritional_info[key]       ||= {}
              @nutritional_info[key][:rdi] ||= nutritional_item.rdi * supplement.serving if nutritional_item.rdi
              @nutritional_info[key][:rdi] += nutritional_item.rdi * supplement.serving if nutritional_item.rdi
              @nutritional_info[key][:qty] ||= RubyUnits::Unit.new("#{nutritional_item.quantity * supplement.serving} #{nutritional_item.unit}") if nutritional_item.unit && nutritional_item.quantity
              @nutritional_info[key][:qty] += RubyUnits::Unit.new("#{nutritional_item.quantity * supplement.serving} #{nutritional_item.unit}") if nutritional_item.unit && nutritional_item.quantity

              @nutritional_info[key][:qty] ||= nutritional_item.quantity * supplement.serving if nutritional_item.quantity && !nutritional_item.unit
              @nutritional_info[key][:qty] += nutritional_item.quantity * supplement.serving if nutritional_item.quantity && !nutritional_item.unit
            end
          end
        end

        @nutritional_info = Hash[@nutritional_info.sort]
      end

    end
  end
end
