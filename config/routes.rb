Rails.application.routes.draw do
  authenticate :user do
    mount Avo::Engine, at: Avo.configuration.root_path
  end

  devise_for :users

  root "home#index"

  resources :posts, only: %i[index show], path: :notas
end
