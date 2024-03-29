Rails.application.routes.draw do
  devise_for :users
  root to:  "dears#index"
  resources :dears, only:[:index]
end
