Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  Rails.application.routes.draw do
    devise_for :users, controllers: { registrations: 'registrations' }
    # Otras rutas de tu aplicación
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root 'feed#index'

  resources :publications do
    resources :likes, only: [:create], shallow: true
    resources :comments, only: [:create]
  end

  resources :notifications, only: [:index]
  resources :users, only: [:index]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
