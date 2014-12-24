Rails.application.routes.draw do
  root 'reports#index'
  resources :reports, only: [:index, :show, :new, :create]
end
