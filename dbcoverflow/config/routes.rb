Dbcoverflow::Application.routes.draw do
  root to: 'questions#index'

  resources :users
  resources :comments
  resources :votes
  resources :questions do
    resources :answers
  end
end
