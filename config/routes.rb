Rails.application.routes.draw do
  get 'short_movies/add'
  post 'short_movies/add'
  post 'short_movies/create'
  post 'searches/show'
  get 'api/index'
  post 'api/index'
  get 'short_movies/show'
  get 'pages/fun'
  get 'pages/personal'
  get 'pages/social_projects'

  root 'pages#build'
end
