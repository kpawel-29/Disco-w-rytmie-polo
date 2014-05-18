MyGists::Application.routes.draw do
  get "gists/search"

  resources :gists
  
  root :to => "gists#index"

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

end
