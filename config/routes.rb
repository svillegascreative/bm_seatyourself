Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants

    resources :users do
  resources :restaurants, only: [:create, :update, :destroy, :index, :show]
  end

  resources :reservations

  resources :sessions, only: [:new, :create, :destroy]

end
