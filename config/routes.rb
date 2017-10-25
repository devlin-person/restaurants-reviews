Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :searches
      resources :restaurants
      resources :reviews
      resources :users
    end
  end

  namespace :admin do
    resources :users
    resources :restaurants
    resources :reviews
  end

  resources :homes, only: [:index]
  resources :users
  root "homes#index"

  get "*path", to: "homes#index"
end
