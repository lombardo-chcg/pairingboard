Rails.application.routes.draw do

  root "offerings#index"
  get '/', to:"offerings#index"
  resources :users,except: [:index, :delete]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :offerings, except: [ :update, :edit, :put  ]

  resources :appointments, only: [ :create, :destroy ]
end
