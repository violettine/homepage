Rails.application.routes.draw do
  get 'api_page/index'
  get 'short_movies/show'
  get 'pages/fun'
  get 'pages/personal'
  get 'pages/social_projects'

  root 'pages#build'
end
