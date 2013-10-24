ProjectWealth::Application.routes.draw do
  root 'application#index'

  resources :indicators

  resources :projects do
    resources :iterations
    resources :ratings, only: [:index, :create]
  end
end
