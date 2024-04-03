Rails.application.routes.draw do
  devise_for :users
  root to:  "presents#index"
  resources :boxes
  resources :presents
end
