module Doorkeeper
  class TokensController < ActionController::Metal
    include Helpers::Controller

    def create
      response = strategy.authorize
      self.headers.merge! response.headers
      token_data = response.body.as_json
      token_data = token_data.merge(UserSerializer.new(user_by(token_data['access_token'])).as_json)
      self.response_body = token_data.to_json
      self.status        = response.status
    rescue Errors::DoorkeeperError => e
      handle_token_exception e
    end

    private

    def user_by(token)
      User.find(Doorkeeper::AccessToken.find_by(:token => token).try(:resource_owner_id))
    end

    def strategy
      @strategy ||= server.token_request params[:grant_type]
    end
  end
end
