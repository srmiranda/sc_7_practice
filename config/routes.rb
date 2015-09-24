Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :manufacturers, only: [:index, :new, :create]
end
