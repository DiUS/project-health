ProjectWealth::Application.routes.draw do
  resources :categories

  get "dashboard/index"
  root 'application#index'

  resources :indicators

  resources :projects do
    resources :iterations
    resources :dashboard, only: [:index]
    resources :ratings, only: [:index, :create]
  end
end
