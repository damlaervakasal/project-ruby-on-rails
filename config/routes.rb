Rails.application.routes.draw do

  resources :cards do
    resources :comments
  end

  resources :users do
    resources :cards, only: :index
  end
  
  root 'cards#index'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  resources :users
  resources :searches, only:[:show]

  patch '/searches/show', to: 'searches#show', as: 'searches_show'

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  post 'signup', to: 'users#create'
  post "login", to: "sessions#create"
  delete 'logout', to: 'sessions#destroy'
  
  
  
end
 

