Rails.application.routes.draw do

  # get '/home' => 'pages#index'

  root to: 'pages#index'
  # get '/pages/index'
  resources :users

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/cards' => 'cards#get_user_cards'
  post '/cards' => 'cards#create'
  # delete '/card/:id' => 'cards#delete'

  get '/app' => 'app#index'

  get '/workspaces' => 'workspaces#index'
  # post '/workspaces' => 'workspaces#create'
  # route to share workspaces
  # => 'workspaces#share_with_user'
  # delete '/workspace/:id' => 'workspaces#delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
