Rails.application.routes.draw do
  resources :gigs
  resources :musicians
  post '/login', to: 'application#login'
  get '/profile', to: 'musicians#profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
