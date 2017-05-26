Rails.application.routes.draw do
  #User stuff
  post 'user_token' => 'user_token#create'
  post '/quickSignup' => 'users#quickSignup'
  resources :users do
    member do
      get :confirm_email
      get '/users/current-user', to: "current_user#show"
    end
  end

  # Get Tools
  resources :tools
  get '/tool/search_tools' => 'tools#search_tools'
  # Get Cars
  resources :cars
  get '/cars/user/:id' => 'cars#user_cars'
  get 'search_queries/car_search_homepage' => 'search_queries#car_search_homepage'
  #Get sales
  get '/sales/leaser/:id' => 'sales#user_sales'

  # Get Bookings
  post '/bookings' => 'bookings#create'
  get '/bookings/tool/:id' => 'bookings#tool_bookings'
  get '/bookings/leaser/:id' => 'bookings#leaser_bookings'
  get '/bookings/renter/:id' => 'bookings#renter_bookings'
  mount Knock::Engine => "/knock"

  # Get notifications
  post '/notifications' => 'notifications#create'
  get '/notifications' => 'notifications#index'
  get '/notifications/user/:id' => 'notifications#userNotifications'

  # Charges
  resources :charges
  post 'charges/stripe_activate' => 'charges#stripe_activate'
end
