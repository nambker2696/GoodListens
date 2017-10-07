Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "static_pages#home"
  devise_for :users
  resources :users, only: %i(show)
  resources :songs, only: %i(index show) do
    resources :reviews do
      resources :comments, only: %i(create destroy)
      resources :likes, only: %i(create destroy)    
    end
  end
  resources :relationships, only: %i(create destroy)
end
