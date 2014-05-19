MyGists::Application.routes.draw do
  get "gists/search"
  get "static_pages/login_required"
  get "static_pages/login_failed"

  resources :gists
  
  root :to => "gists#index"

=begin
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
=end

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: 'static_pages#login_failed', via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
