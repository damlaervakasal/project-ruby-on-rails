Rails.application.routes.draw do

  get "/cards", to: "cards#index"
  get "/cards/new", to:"cards#new"
  get "/cards/:id", to:"cards#show"

  resources :cards do
    resources :comments
  end

  root 'cards#index'
end
