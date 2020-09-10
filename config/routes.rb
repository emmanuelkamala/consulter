Rails.application.routes.draw do
  resources :consultants do  
    resources :meetings
    collection do
      post 'login'
    end
  end

  resources :users do 
    resources :meetings
    collection do
      post 'login'
    end
  end
 
end
