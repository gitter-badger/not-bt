Rails.application.routes.draw do
  resources :reports, only: [:index, :show, :new, :create]
end
