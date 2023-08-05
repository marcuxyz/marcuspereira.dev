Rails.application.routes.draw do
  namespace :admin, path: ENV.fetch('ADMIN_ROUTE_PATH', '/admin') do
    resources :categories
    resources :posts
    resources :users

    root to: "categories#index"
  end

  devise_for :users

  root "home#index"

  resources :posts, only: %i[show]
end
