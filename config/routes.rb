Rails.application.routes.draw do
  resources :subjects
  resources :sessions, only: %i(create destroy)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
