Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create]
      resources :store_comments
      resources :comments
      resources :wait_times
      resources :stores
      post "/login", to: "auth#create"
      get "/current_user", to: "auth#show"
      get "/session", to: "session#create"
    end
  end
end
