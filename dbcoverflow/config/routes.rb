Dbcoverflow::Application.routes.draw do

  resources :user
  resources :comments
  resources :votes
  resources :answers
  # resources :questions 
    # resources :answers
  root :to => "questions#new"
  

# match 'questions/show_comment', to: 'questions#show_comment', via: :get

  
  # match 'questions/show_comment', to:  'questions#show_comment', via: get

  resources :questions do
    resources :comments 
  end


  #get '/questions/:id/show_comment' => "comments#show"


  # resources :questions do
  #   member do
  #     get 'show_comment'
  #   end
  # end


end
