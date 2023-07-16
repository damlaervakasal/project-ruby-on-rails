Rails.application.routes.draw do


  resources :cards do
    resources :comments
  end

  root 'cards#index'
end
