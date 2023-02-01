Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "players#index"

  post '/players/updateStats', to: 'players#updateStats'

  resources :players
  get '/players/:id(/week/:weekNum)', to: 'players#weekStats'

  resources :fantasy_teams

  get '/matchups/:weekNum', to: 'matchups#show'

  
  
end
