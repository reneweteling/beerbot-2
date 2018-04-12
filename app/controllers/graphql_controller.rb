class UnauthorizedRequestError < StandardError; end

class GraphqlController < ApplicationController

  before_action :require_basic_authentication
  skip_before_action :verify_authenticity_token

  include ActionController::HttpAuthentication::Token::ControllerMethods
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  rescue_from UnauthorizedRequestError, with: :unauthorized_request_error

  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      # Query context goes here, for example:
      # current_user: current_user,
    }
    result = BeerbotSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  end

  private

  def unauthorized_request_error(error)
    render status: :unauthorized, json: {error: :unauthorized, message: 'Be sure to include the "Authorization" header.'}
  end

  def require_basic_authentication
    raise UnauthorizedRequestError, 'Basic' unless authenticate_with_http_basic do |client_id, client_secret|
      @api_client = ApiClient.active.find_by(client_id: client_id, client_secret: client_secret)
    end
  end

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end
end
