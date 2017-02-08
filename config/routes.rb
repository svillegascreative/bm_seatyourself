Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants do
    resources :reservations
  end

  resources :users do
    resources :reservations, only: [:show, :update, :edit, :destroy]
    resources :restaurants do  #as owner
      resources :reservations
    end
  end

# resources :restaurants, only: [:create, :update, :destroy, :index, :show]
# end

  resources :categories

  resources :sessions, only: [:new, :create, :destroy]

end
