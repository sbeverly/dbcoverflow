Dbcoverflow::Application.routes.draw do

  resources :user
  resources :comments
  resources :votes
  resources :questions 
    # resources :answers
  root :to => "questions#new"
  

# match 'questions/show_comment', to: 'questions#show_comment', via: :get

  
  # match 'questions/show_comment', to:  'questions#show_comment', via: get

  resources :questions do
    member do
      get 'show_comment'
    end
  end

  # resources :questions do
  #   resources :comments 
  # end

end
