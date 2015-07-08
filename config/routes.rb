Rails.application.routes.draw do
  post 'api/index'
  get 'api/index'
  get 'short_movies/show'
  get 'pages/fun'
  get 'pages/personal'
  get 'pages/social_projects'

  root 'pages#build'
end
