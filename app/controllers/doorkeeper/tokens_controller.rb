module Doorkeeper
  class TokensController < ActionController::Metal
    include Helpers::Controller
    include ActionController::RequestForgeryProtection

    def create
      response = strategy.authorize
      self.headers.merge! response.headers
      token_data = response.body.as_json
      user = user_by(token_data['access_token'])
      token_data = token_data.merge(UserSerializer.new(user).as_json)
      token_data = token_data.merge(csrf_tokens)
      self.response_body = token_data.to_json
      self.status        = response.status
    rescue Errors::DoorkeeperError => e
      handle_token_exception e
    end

    private

    def user_by(token)
      User.find(Doorkeeper::AccessToken.find_by(:token => token).try(:resource_owner_id))
    end

    def csrf_tokens
      {
          'csrf-param' => request_forgery_protection_token,
          'csrf-token' => form_authenticity_token
      }
    end

    def strategy
      @strategy ||= server.token_request params[:grant_type]
    end
  end
end
