Rails.application.routes.draw do
  devise_for :admins
  post 'api/youtube_request'
  get 'short_movies/add'
  post 'short_movies/add'
  post 'short_movies/create'
  get 'short_movies/suggest'
  post 'short_movies/suggest'
  post 'short_movies/suggest_to_db'
  post 'searches/show'
  get 'api/index'
  post 'api/index'
  get 'short_movies/show'
  get 'pages/fun'
  get 'pages/personal'
  get 'pages/social_projects'

  root 'pages#build'
end
