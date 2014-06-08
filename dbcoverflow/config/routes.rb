Dbcoverflow::Application.routes.draw do
  root to: 'questions#index'

  resources :users
  resources :votes
  resources :answers
  
  resources :questions do
    resources :answers
    resources :comments 
  end

  get '/login' => 'sessions#new', :as => :login
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  post '/questions/:id/upvote' => 'questions#upvote', :as => :question_upvote
  post '/questions/:id/downvote' => 'questions#downvote', :as => :question_downvote
end


