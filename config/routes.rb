Rails.application.routes.draw do

  resources :cards do
    resources :comments
  end
  
  root 'cards#index'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  post "login", to: "sessions#create"
  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
  
end
 

