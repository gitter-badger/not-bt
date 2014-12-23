Rails.application.routes.draw do
  resources :reports, only: [:index, :new, :create]
end
