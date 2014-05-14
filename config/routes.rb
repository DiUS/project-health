ProjectWealth::Application.routes.draw do

  resources :iterations
  resources :projects
  resources :categories
  resources :indicators

  root 'home#index'
  get '/home/', to: "home#index"
  
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/sessions/destroy'

  resources :projects do
    resources :iterations
    resources :dashboard, only: [:index]
    resources :ratings, only: [:index, :create]
    post "update_indicators"
    post "update_users"
  end
end
