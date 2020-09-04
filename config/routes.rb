Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :meetings
      scope '/auth' do
        post '/signin', to: 'user_token#create'
        post '/signup', to: 'users#create'
      end
    end
  end

 

 
end
