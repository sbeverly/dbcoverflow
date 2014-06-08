Dbcoverflow::Application.routes.draw do
  root to: 'questions#index'

  resources :users
  resources :comments
  resources :votes
  resources :answers
  resources :questions do
    resources :comments 
  end

  get "log_in" => "sessions/new", as: "log_in"
  resources :sessions
end


