Rails.application.routes.draw do
  devise_for :users
  root to:  "presents#index"
  resources :boxes
  resources :presents, only: [:index, :new, :create, :show]
end
