Dbcoverflow::Application.routes.draw do
  root to: 'questions#index'

  resources :users
  resources :comments
  resources :votes
  resources :questions do
    resources :answers
    resources :comments 
  end

  get '/login' => 'sessions#new', :as => :login
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end


