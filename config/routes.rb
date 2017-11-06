Rails.application.routes.draw do
  resources :album_likes
  resources :album_comments
  scope ":locale", locale: /en|vi|jp/ do
    mount RailsAdmin::Engine => "/admin", as: "rails_admin"
    root "static_pages#home"
    get "searchs/index"
    devise_for :users, controllers: { registrations: :registrations }
    resources :albums do
      get 'category/', to: 'albums#category'
    end
    
    resources :users, only: %i(show)
    resources :categories, only: %i(show index)
    resources :songs, only: %i(index show) do
      resources :reviews do
        resources :bookmarks, only: %i(create destroy)
        resources :comments, only: %i(create destroy update)
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
