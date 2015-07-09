Rails.application.routes.draw do
  get 'searches/show'
  post 'searches/show'

  get 'api/index'
  post 'api/index'
  
  get 'short_movies/show'
  #post 'short_movies/show'

  get 'pages/fun'
  get 'pages/personal'
  get 'pages/social_projects'

  root 'pages#build'
end
