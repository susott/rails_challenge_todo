Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :to_dos, :only => [:new, :create, :destroy]
  resources :to_do_lists, :only => [:show, :create, :destroy]
  resources :campaigns, :only => [:index, :new, :show, :create, :destroy]
  resources :comments, :only => [:index, :new, :create, :destroy]
  devise_for :installs
  devise_for :users, :path_prefix => 'my', controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations"
  }
  resources :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
end
