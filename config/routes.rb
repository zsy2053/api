Rails.application.routes.draw do
  resources :cars
  get '/users/current-user', to: "current_user#show"
  resources :users
  mount Knock::Engine => "/knock"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
