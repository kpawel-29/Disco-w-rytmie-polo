MyGists::Application.routes.draw do
  get "gists/search"


  resources :gists

  root 'gists#index'


  match '/auth/:provider/callback', :to => 'sessions#create',  via: [:get, :post]
  match '/auth/failure', :to => 'sessions#failure', via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
