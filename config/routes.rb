Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }



  resources :reviews, only: [:new, :create]

  resources :meetings

  resources :groups, only: [:new, :create, :delete]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show]

end
