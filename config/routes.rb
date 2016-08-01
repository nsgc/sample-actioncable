Rails.application.routes.draw do
  resources :subjects do
    collection do
      get :list
    end
  end
  resources :sessions, only: %i(create destroy)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
