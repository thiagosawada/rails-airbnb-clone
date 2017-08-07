Rails.application.routes.draw do
  root to: 'pages#home'

  resources :users do
    resources :reviews, only: [:new, :create]
    resources :meetings, only: [:new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
