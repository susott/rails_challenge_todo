Rails.application.routes.draw do
  get 'campaigns/index'
  get 'campaigns/show'
  get 'campaigns/new'
  get 'campaigns/create'
  get 'campaigns/destroy'

  get 'comments/index'
  get 'comments/show'
  get 'comments/new'
  get 'comments/create'
  get 'comments/destroy'

  devise_for :installs
  devise_for :users
  root to: 'pages#home'
  # resources :campaigns
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
