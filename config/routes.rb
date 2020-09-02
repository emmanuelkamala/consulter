Rails.application.routes.draw do

  resources :meetings
  resources :users do
    collection do
      post 'login'
    end
  end
end
