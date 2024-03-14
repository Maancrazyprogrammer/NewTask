Rails.application.routes.draw do
  root "companies#index"
  devise_for :users
  resources :companies do
    resources :accounts
    resources :payments
  end
  resources :reports
  resources :users
  resources :accounts
  resources :payments
  resources :reports, only: [:index] do
    post 'generate', on: :collection
  end
  # config/routes.rb
resources :reports, only: [:index, :show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
