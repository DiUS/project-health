ProjectWealth::Application.routes.draw do

  resources :spans

  resources :projects

  resources :categories

  get "dashboard/index"
  root 'application#index'

  resources :indicators

  resources :projects do
    resources :spans
    resources :dashboard, only: [:index]
    resources :ratings, only: [:index, :create]
  end
end
