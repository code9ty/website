Rails.application.routes.draw do
  get 'signup' => 'users#new'
  resources :users, except: [:new] do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
