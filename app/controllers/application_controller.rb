class ApplicationController < ActionController::API

  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods
  
  respond_to :json

  before_action :authenticate_tourist, unless: :devise_controller?

  private

    def authenticate_tourist
      if request.headers['Authorization'].present?
        authenticate_or_request_with_http_token do |token|
          begin
            jwt_payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first

            @current_tourist_id = jwt_payload['id']
          rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
            head :unauthorized
          end
        end
      end
    end

    def authenticate_tourist!(options = {})
      head :unauthorized unless signed_in?
    end

    def current_tourist
      @current_tourist ||= super || Tourist.find(@current_tourist_id)
    end

    def signed_in?
      @current_tourist_id.present?
    end

end
