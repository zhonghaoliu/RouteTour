Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  devise_scope :user do
    authenticated :user do
      root 'trip#index'
    end
  
    unauthenticated do
      root 'devise/sessions#new'
    end
  end

  resources :users, only: [:show, :edit, :update]
  
  get 'trip/index'
  resources :trip, only: [:show, :edit, :update]

  # get 'hello_world', to: 'hello_world#index'
  #get 'chat/new'
  #get "/chat" => redirect("http://localhost:8080")

  get 'trip/create'

  get 'trip/new'
  post 'trip' => 'trip#create'
  put 'trip' => 'trip#update'

  get 'trip/dashboard' => 'chat#dashboard'

  get '/trip/chat' => 'chat#new'
  get '/trip/chat/:tripid' => 'chat#trip'
  
  get 'home/index'

  post 'auth_user' => 'authentication#authenticate_user'
  get 'home' => 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
