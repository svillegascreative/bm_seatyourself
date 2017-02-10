Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  resources :users

  resources :restaurants do  #as owner
    resources :reservations
  end

  resources :categories, only: [:index, :show]

  resources :sessions, only: [:new, :create, :destroy]

end
