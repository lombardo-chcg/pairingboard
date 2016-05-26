Rails.application.routes.draw do

  root "offerings#index"
  get '/', to:"offerings#index"
  resources :users,except: [:index, :delete]

  resources :users do
    resources :conversations,except: [:update, :edit, :put ]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :offerings, except: [ :update, :edit, :put ]
end
