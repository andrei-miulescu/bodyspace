class ApplicationController < ActionController::Base

  PUBLIC_ENDPOINTS = [{controller: 'timelines', action: 'create_with_image'}, {controller: 'posts', action: 'create_with_image'}]

  doorkeeper_for :all, :if => lambda { request.xhr? && !PUBLIC_ENDPOINTS.any? { |e| e[:controller] == controller_name && e[:action] == action_name } }
  before_filter :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  respond_to :html, :json

  helper_method :current_user_json

  before_filter :update_sanitized_params, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  def current_user_json
    if current_user
      UserSerializer.new(current_user, :scope => current_user, :root => false).to_json
    else
      {}.to_json
    end
  end

  def me
    respond_with current_resource_owner
  end

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
  end

end