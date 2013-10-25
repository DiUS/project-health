ProjectWealth::Application.routes.draw do
  get "dashboard/index"
  root 'application#index'

  resources :indicators

  resources :projects do
    resources :iterations
    resources :dashboard, only: [:index]
    resources :ratings, only: [:index, :create]
  end
end
