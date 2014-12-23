Rails.application.routes.draw do
  resources :reports, only: :new
end
