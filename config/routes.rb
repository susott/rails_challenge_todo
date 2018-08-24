Rails.application.routes.draw do
  resources :campaigns, :only => [:index, :new, :show, :create, :destroy]
  resources :comments, :only => [:index, :new, :create, :destroy]

  devise_for :installs
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
