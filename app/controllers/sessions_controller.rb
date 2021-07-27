class SessionsController < Devise::SessionsController

  resource_description do
    api_base_url  '/'
  end

  api :POST, 'tourist/login', 'Login User'
  param :tourist, Hash, desc: 'Tourist login details' do
    param :email, String, desc: "Email for login", :required => true
    param :password, String, desc: "Password for login", :required => true
  end

  def create
    tourist = Tourist.find_by_email(sign_in_params[:email])

    if tourist && tourist.valid_password?(sign_in_params[:password])
      @current_tourist = tourist
      render json: { tourist: @current_tourist, token: tourist.generate_jwt }
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

end
