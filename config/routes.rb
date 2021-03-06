Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  authenticated :user do
    root 'profiles#show', as: :authenticated_root
  end

  root "pages#home"

  get '/styleguide', to: 'pages#styleguide'
  resources :profiles, only: [:update, :new, :create]
  get '/dashboard', to: 'profiles#show', format: false
  get '/settings', to: 'profiles#edit', format: false
  resources :recipes, only: [:index, :show, :new, :create, :edit, :update] do
    resources :ingredients, only: [:new, :create, :destroy]
  end
  resources :added_recipes, only: [ :new, :create, :destroy]

end
