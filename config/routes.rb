Rails.application.routes.draw do

  get 'assignments/new'

  # resources :contributions
  root 'users#show'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' =>'sessions#destroy'
  get 'feedback' => 'comments#index'
  get 'edit_user_comment' => 'comments#edit'
  resources :projects
  resources :assignments, only: [:index, :new, :create]
  resources :users, except: [:new] do
    resources :comments, except: [:index]
  end
end
