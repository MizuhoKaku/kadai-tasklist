Rails.application.routes.draw do
  root to: 'toppages#index'    
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
    
  resources :tasks, only: [:create, :destroy, :edit, :update]
  resources :users, only: [:new, :create]
end
