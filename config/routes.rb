Rails.application.routes.draw do
  root 'landing#index'

  namespace :api do
    namespace :v1 do
      resources :pi_digits, only: [:index]
    end
  end
end
