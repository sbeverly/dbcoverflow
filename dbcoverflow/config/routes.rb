Dbcoverflow::Application.routes.draw do
  root to: 'questions#index'

  resources :users
  resources :votes
  resources :answers

  resources :questions do
    resources :answers
    resources :comments 
  end


  resources :answers do
    resources :comments
  end

  get '/questions/:question_id/show_comment', to: 'comments#show_comment', as: 'show_comment'

  get '/login' => 'sessions#new', :as => :login
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  post '/questions/:id/upvote' => 'questions#upvote', :as => :question_upvote
  post '/questions/:id/downvote' => 'questions#downvote', :as => :question_downvote

  post '/answers/:id/upvote' => 'answers#upvote', :as => :answer_upvote
  post '/answers/:id/downvote' => 'answers#downvote', :as => :answer_downvote
end

