Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }



  resources :reviews, only: [:new, :create]
  resources :meetings, only: [:new, :create, :edit, :update, :destroy, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show]

end
