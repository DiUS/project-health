ProjectWealth::Application.routes.draw do

  resources :iterations
  resources :projects
  resources :categories
  resources :indicators

  get "dashboard/index"
  root 'application#index'

  resources :projects do
    resources :iterations
    resources :dashboard, only: [:index]
    resources :ratings, only: [:index, :create]
    post "update_indicators"
  end
end
