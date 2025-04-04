Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # mount ActionCable.server => '/cable'
  # get '/health_check', to: 'health_checks#index'

  resources :blogs
  resources :rooms, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  # mount ActionCable.server => '/cable'
end
