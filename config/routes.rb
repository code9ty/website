Rails.application.routes.draw do
  resources :contributions
  root 'users#index'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' =>'sessions#destroy'
  resources :users, except: [:new] do
    resources :comments
  end
end
