class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    if params[:token]
      @user = User.find(Doorkeeper::AccessToken.find_by(:token => params[:token]).try(:resource_owner_id))
    end
    render json: {:users => [@user.slice(:id, :email, :name).to_json] }
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

  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
end