Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  resources :cars
  get 'users/cars/:id' => 'users#user_cars'
  get '/users/current-user', to: "current_user#show"
  resources :users
  mount Knock::Engine => "/knock"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
