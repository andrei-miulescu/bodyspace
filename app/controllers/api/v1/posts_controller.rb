module Api
  module V1
    class PostsController < ApiController
      before_action :set_post, only: [:show, :edit, :update, :destroy]
      # GET /posts
      # GET /posts.json
      def index
        @posts = Post.where(:id => params[:ids])
      end

      # GET /posts/1
      # GET /posts/1.json
      def show
      end

      # GET /posts/new
      def new
        @post = Post.new
      end

      # GET /posts/1/edit
      def edit
      end

      def create_with_image
        @post       = Post.find_or_initialize_by(id: params[:id])
        @post.image = params[:file]
        @post.user  = current_user
        respond_to do |format|
          if @post.save(validate: false)
            format.json { render json: {id: @post.id} }
          else
            format.json { render json: @post.errors, status: :unprocessable_entity }
          end
        end
      end

      # POST /posts
      # POST /posts.json
      def create
        @post          = Post.find_or_initialize_by(id: post_params[:id])
        @post.timeline = Timeline.find(post_params.delete(:timeline_id))
        @post.update_attributes(post_params)
        @post.user       = current_user
        @post.start_date = Time.zone.now
        @post.end_date   = Time.zone.now + 1.day
        respond_to do |format|
          if @post.save
            format.json { render action: 'show', status: :created, location: [:api, :v1, @post] }
          else
            format.json { render json: @post.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /posts/1
      # PATCH/PUT /posts/1.json
      def update
        respond_to do |format|
          if @post.update(post_params)
            format.json { head :no_content }
          else
            format.json { render json: @post.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /posts/1
      # DELETE /posts/1.json
      def destroy
        @post.destroy
        respond_to do |format|
          format.html { redirect_to posts_url }
          format.json { head :no_content }
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def post_params
        params.require(:post).permit(:id, :headline, :text, :caption, :timeline_id)
      end
    end
  end
end
