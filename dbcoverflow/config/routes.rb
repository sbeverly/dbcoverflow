Dbcoverflow::Application.routes.draw do

  resources :user
  resources :comments
  resources :votes
  resources :answers
  root :to => "questions#new"
  
  resources :questions do
    resources :comments 
  end


  get '/questions/:question_id/show_comment', to: 'comments#show_comment', as: 'show_comment'


end
