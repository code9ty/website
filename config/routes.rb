Rails.application.routes.draw do

  get 'home' => 'static_pages#home'
  root 'static_pages#home'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' =>'sessions#destroy'
  get 'feedback' => 'comments#index'
  get 'dashboard' => 'users#dashboard'
  get 'edit_user_comment' => 'comments#edit'
  get 'assign' => 'bids#assign'
  get 'apply' =>  'applicants#new'
  post 'apply' =>  'applicants#create'
  get 'applicants' => 'applicants#index'
  get 'accept' => 'applicants#accept'
  get 'profiles' =>'profiles#pride'
  resources :bids
  resources :projects
  resources :assignments, only: [:index, :new, :create]
  resources :users, except: [:new] do
    resources :comments, except: [:index]
    resources :applicants
  end
end
