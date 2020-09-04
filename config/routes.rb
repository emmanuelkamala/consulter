Rails.application.routes.draw do
  scope '/auth' do
    post '/signin', to: 'user_token#create'
    post '/signup', to: 'users#create'
   end
   
  resources :meetings
  resources :users
end
