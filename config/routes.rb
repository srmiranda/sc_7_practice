Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :manufacturer, only: [:index, :new, :create]
end
