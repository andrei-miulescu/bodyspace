class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update, :destroy]

  def index
    if params[:token]
      @user = User.find(Doorkeeper::AccessToken.find_by(:token => params[:token]).try(:resource_owner_id))
    end
    render json: {:users => [@user.slice(:id, :email, :name).to_json]}
  end

  def show
    @user = User.find(params[:id]) if params[:id]
    if params[:token]
      @user = User.find(Doorkeeper::AccessToken.find_by(:token => params[:token]).try(:resource_owner_id))
    end
    respond_to do |format|
      format.json { render action: 'show', status: :created, location: @user }
    end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.json { head :no_content }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :id)
  end
end