Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations'}
  scope ":locale", locale: /en|vi|jp/ do
    mount RailsAdmin::Engine => "/admin", as: "rails_admin"
    root "static_pages#home"
    get "searchs/index"
    devise_for :users, skip: :omniauth_callbacks
    resources :albums do
      resources :album_likes, only: %i(create destroy)    
      resources :album_comments,only: %i(create destroy update)
      get 'category/', to: 'albums#category'
    end
    
    resources :users, only: %i(show)
    resources :categories, only: %i(show index)
    resources :songs, only: %i(index show) do
      resources :reviews do
        resources :bookmarks, only: %i(create destroy)
        resources :comments, only: %i(create destroy update) do
          resources :like_comments, only: %i(create destroy)
        end
        resources :likes, only: %i(create destroy)    
      end
    end
    resources :relationships, only: %i(create destroy)
    resources :singers, only: ['index', 'show'] do
       get :search, on: :collection
    end
  end
  root to: redirect("/#{I18n.default_locale}", status: 302),
    as: :redirected_root
end
