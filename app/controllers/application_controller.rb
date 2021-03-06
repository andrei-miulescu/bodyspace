class ApplicationController < ActionController::Base

  PUBLIC_ENDPOINTS = [{ controller: 'timelines', action: 'create_with_image'},
                      { controller: 'posts', action: 'create_with_image'},
                      { controller: 'users', action: 'create'},
                      { controller: 'registrations', action: 'create'},
                      { controller: 'sessions', action: 'destroy'}]

  doorkeeper_for :all, :if => lambda { request.xhr? && !PUBLIC_ENDPOINTS.any? { |e| e[:controller] == controller_name && e[:action] == action_name }}
  before_filter :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  respond_to :html, :json

  before_filter :update_sanitized_params, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  def me
    respond_with current_resource_owner
  end

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email, :password, :password_confirmation)}
  end

end
