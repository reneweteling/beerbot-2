class ApiClientConstraint
  def self.matches?(request)
    (client_id, client_secret) = ActionController::HttpAuthentication::Basic.decode_credentials(request).split(':')
    @oauth_client = ApiClient.active.find_by(client_id: client_id, client_secret: client_secret)
  end
end

Rails.application.routes.draw do
  post '/graphql', to: "graphql#execute"
end

