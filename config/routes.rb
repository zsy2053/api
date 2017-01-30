Rails.application.routes.draw do
  resources :pets
  mount_devise_token_auth_for 'User', at: 'auth'
  #User stuff
  post 'user_token' => 'user_token#create'
  resources :users
  get '/users/current-user', to: "current_user#show"

  # Get Cars
  resources :cars
  get 'users/cars/:id' => 'users#user_cars'
  post 'search_queries/car_search_homepage' => 'search_queries#car_search_homepage'
  #Get sales
  get '/sales/leaser/:id' => 'sales#user_sales'

  # Get Bookings
  get '/bookings/leaser/:id' => 'bookings#leaser_bookings'
  get '/bookings/renter/:id' => 'bookings#renter_bookings'
  mount Knock::Engine => "/knock"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
