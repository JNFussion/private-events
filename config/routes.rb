Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "events#index"
  resources :users, only: [:show, :new, :create]
  resources :events, except: [:edit, :destroy]
  resources :sessions, only: [:create]
  
  get 'log_in', to: "sessions#new"
  delete 'log_out', to: 'sessions#destroy' 
end
