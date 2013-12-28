module Api
  module V1
    class NutritionalItemsController < ApiController
      before_action :set_nutritional_item, only: [:show, :edit, :update, :destroy]

      def index
        @nutritional_items = NutritionalItem.where(:id => params[:ids])
      end

      def show
      end

      def new
        @nutritional_item = NutritionalItem.new
      end

      def edit
      end

      def create
        @nutritional_item = NutritionalItem.create(nutritional_item_params)
        respond_to do |format|
          if @nutritional_item.save
            format.json { render action: 'show', status: :created, location: [:api, :v1,@nutritional_item] }
          else
            format.json { render json: @nutritional_item.errors, status: :unprocessable_entity }
          end
        end

      end

      def update
        respond_to do |format|
          if @nutritional_item.update(nutritional_item_params)
            format.json { head :no_content }
          else
            format.json { render json: @nutritional_item.errors, status: :unprocessable_entity }
          end
        end
      end

      def destroy
        @nutritional_item.destroy
        respond_to do |format|
          format.json { head :no_content }
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_nutritional_item
        @nutritional_item = NutritionalItem.find(params[:id])
      end


      # Never trust parameters from the scary internet, only allow the white list through.
      def nutritional_item_params
        params.require(:nutritional_item).permit(:id, :name, :quantity, :rdi, :supplement_id)
      end

    end
  end
end