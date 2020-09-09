Rails.application.routes.draw do
  resources :consultants
  resources :users
  resources :meetings
end
