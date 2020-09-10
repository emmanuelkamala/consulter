Rails.application.routes.draw do
  resources :consultants do  
    resources :meetings
  end

  resources :users do 
    resources :meetings
    collection do
      post 'login'
    end
  end

  # post 'auth/signup', to:  'users#create'
  # post 'auth/login', to: 'authentication#authenticate'
 
end
