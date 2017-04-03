Rails.application.routes.draw do
  resources :tools
  #User stuff
  post 'user_token' => 'user_token#create'

  resources :users do
    member do
      get :confirm_email
      get '/users/current-user', to: "current_user#show"
    end
  end

  # Get Cars
  resources :cars
  get '/cars/user/:id' => 'cars#user_cars'
  get 'search_queries/car_search_homepage' => 'search_queries#car_search_homepage'
  #Get sales
  get '/sales/leaser/:id' => 'sales#user_sales'

  # Get Bookings
  get '/bookings/car/:id' => 'bookings#car_bookings'
  get '/bookings/leaser/:id' => 'bookings#leaser_bookings'
  get '/bookings/renter/:id' => 'bookings#renter_bookings'
  mount Knock::Engine => "/knock"

  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
