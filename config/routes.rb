Rails.application.routes.draw do
  get 'searchs/index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "static_pages#home"
  devise_for :users, controllers: { registrations: :registrations }
  resources :users, only: %i(show)
  resources :categories, only: %i(show index)
  resources :songs, only: %i(index show) do
    resources :reviews do
      resources :bookmarks, only: %i(create destroy)
      resources :comments, only: %i(create destroy)
      resources :likes, only: %i(create destroy)    
    end
  end
  resources :relationships, only: %i(create destroy)
end
