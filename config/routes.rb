Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  resources :restaurants do  #as owner
    resources :reservations
  end

  resources :categories

  resources :sessions, only: [:new, :create, :destroy]

end
