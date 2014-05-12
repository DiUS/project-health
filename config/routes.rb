ProjectWealth::Application.routes.draw do

  resources :iterations
  resources :projects
  resources :categories
  resources :indicators

  root 'application#index'
  get '/home/index'
  
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :projects do
    resources :iterations
    resources :dashboard, only: [:index]
    resources :ratings, only: [:index, :create]
    post "update_indicators"
    post "update_users"
  end
end
