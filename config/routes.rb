Rails.application.routes.draw do
  root 'movies#index'

  get 'search_movies', to: 'movies#search', as: 'search_movies'

  resources :movies
end
