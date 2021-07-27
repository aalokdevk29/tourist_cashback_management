Rails.application.routes.draw do
  apipie
  defaults format: :json do

    devise_for :tourists, controllers: { sessions: :sessions },
                path_names: { sign_in: :login }

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    namespace :api do
      namespace :v1 do
        resources :cashbacks, only: :index
      end
    end
  end
end
