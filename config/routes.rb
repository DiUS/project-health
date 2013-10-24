ProjectWealth::Application.routes.draw do
  root 'application#index'

  resources :indicators

  resources :projects do
    resources :iterations do
      resources :ratings, only: [:index, :create]
    end
  end
end
