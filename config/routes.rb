Rails.application.routes.draw do
  scope '/auth' do
    post '/signin', to: 'user_token#create'
    post '/signup', to: 'users#create'
    
   end
  # post 'user_token' => 'user_token#create'
  resources :meetings
  # resources :tokens, only: [:create]
  # resources :users do
  #   collection do
  #     post 'login'
  #   end
  # end

  resources :users
end
